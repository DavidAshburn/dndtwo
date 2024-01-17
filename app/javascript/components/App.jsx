import React, { useState, useEffect } from 'react';
import Statframe from './Statframe';
import Pointbuy from './Pointbuy';
import Rollstats from './Rollstats';
import Profpane from './Profpane';
import Armor from './Armor';
import Weapons from './Weapons';

function getMod(stat) {
  return Math.floor(stat / 2) - 5;
}

function signed(number) {
  if (number > 0) return '+' + number;
  return number;
}

export default function App() {
  let [labels, setLabels] = useState({
    races: [],
    classes: [],
    backgrounds: [],
  });
  //dynamic dropdown content for subclass and subrace - useEffect hook fetches these
  let [subclassLabels, setSubclassLabels] = useState(null);
  let [subraceLabels, setSubraceLabels] = useState(null);

  //character traits, pull in full json from db as source of truth - onChange fetches and updates these
  let [stats, setStats] = useState([8, 8, 8, 8, 8, 8]);
  let [level, setLevel] = useState(1);
  let [race, setRace] = useState({});
  let [subrace, setSubrace] = useState({});
  let [pclass, setPClass] = useState({});
  let [subclass, setSubclass] = useState({});
  let [background, setBackground] = useState({});

  //PC state variable storage
  let [proficiencies, setProficiencies] = useState([
    0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ]);

  //data resources
  let statnames = [
    'Strength',
    'Dexterity',
    'Constitution',
    'Intelligence',
    'Wisdom',
    'Charisma',
  ];

  let proficiency_data = [
    ['Acrobatics', 1],
    ['Animal Handling', 4],
    ['Arcana', 3],
    ['Athletics', 0],
    ['Deception', 5],
    ['History', 3],
    ['Insight', 4],
    ['Intimidation', 5],
    ['Investigation', 3],
    ['Medicine', 4],
    ['Nature', 3],
    ['Perception', 4],
    ['Performance', 5],
    ['Persuasion', 5],
    ['Religion', 3],
    ['Sleight of Hand', 1],
    ['Stealth', 1],
    ['Survival', 4],
  ];

  //------------------------------------------------------------------//

  //loads labels for dropdown options
  useEffect(() => {
    function loadDropdownLabels(data) {
      setLabels(data);
      setSubclassLabels(data.classes[0][1]);
      setSubraceLabels(data.races[0][1]);
      initPC();
    }

    fetch(`/labels/dropdowns`)
      .then((response) => response.json())
      .then((data) => loadDropdownLabels(data));
  }, []);

  //once labels are pulled we initialize the character to the first option in each dropdown
  function initPC() {
    function setInit(data) {
      setRace(data.pcrace);
      setSubrace(data.subrace);
      setPClass(data.pclass);
      setSubclass(data.subclass);
      setBackground(data.background);
    }

    fetch(`/labels/initPC`)
      .then((response) => response.json())
      .then((data) => setInit(data));
  }

  //fetch data into state - called from onChange functions in dropdowns
  function loadClass(name) {
    fetch(`/player_classes/` + name)
      .then((response) => response.json())
      .then((data) => setPClass(data));
  }

  function loadSubclass(name) {
    fetch(`/subclasses/` + name)
      .then((response) => response.json())
      .then((data) => setSubclass(data));
  }

  function loadRace(name) {
    fetch(`/races/` + name)
      .then((response) => response.json())
      .then((data) => setRace(data));
  }

  function loadSubrace(name) {
    fetch(`/subraces/` + name)
      .then((response) => response.json())
      .then((data) => setSubrace(data));
  }

  function loadBackground(name) {
    fetch(`/backgrounds/` + name)
      .then((response) => response.json())
      .then((data) => setBackground(data));
  }

  //onChange functions in dropdowns
  function handleClassSelect(event) {
    let dex = event.target.value;
    setSubclassLabels(labels.classes[dex][1]);

    loadClass(labels.classes[dex][0]);

    let firstSubclassName = labels.classes[dex][1][0];
    loadSubclass(firstSubclassName);
  }

  function handleSubclassSelect(event) {
    fetch(`/subclasses/` + event.target.value)
      .then((response) => response.json())
      .then((data) => setSubclass(data));
  }

  function handleRaceSelect(event) {
    let dex = event.target.value;
    setSubraceLabels(labels.races[dex][1]);

    loadRace(labels.races[dex][0]);

    let firstSubraceName = labels.races[dex][1][0];
    loadSubrace(firstSubraceName);
  }

  function handleSubraceSelect(event) {
    fetch(`/subraces/` + event.target.value)
      .then((response) => response.json())
      .then((data) => setSubrace(data));
  }

  function handleBackgroundSelect(event) {
    loadBackground(event.target.value);
  }

  function updateLevel(event) {
    setLevel(event.target.value);
  }

  //different methods of setting base stats - onClick functions for Stat buttons
  function randomStats(event) {
    let stats = [];
    for (let i = 0; i < 6; i++) {
      stats.push(Math.floor(Math.random() * 13 + 8));
    }
    setStats(stats);
  }

  function openPointBuy(event) {
    document.getElementById('pointbuy').showModal();
  }

  function openRollStats(event) {
    document.getElementById('rollstats').showModal();
  }

  function flatStats(event) {
    setStats([10, 10, 10, 10, 10, 10]);
  }

  //class features only, duplicates are not removed
  function getLeveledFeatures(features, level) {
    let levelfeats = [];
    let takendata = [];

    let namedex = 0;
    let names = [];
    let nameindexes = [];

    for (let [key, val] of Object.entries(features)) {
      //in all features
      if (parseInt(key) <= level) {
        //if the minimum level requirement is met
        for (let item of val) {
          if (item != 'Ability Score Increase:') {
            // skip ASI increases
            //check for duplicates among existing features
            let name = item.split(':')[0];
            let check = names.indexOf(name);
            if (check > -1) {
              levelfeats[check] = item; //replace duplicate features with their newer versions
            } else {
              levelfeats.push(item); //add features that have no duplicates to the end of the list
              names.push(name); //add the new names to the namelist
            }
            namedex++;
          }
        }
      }
    }
    return levelfeats;
  }

  function runDebug(event) {
    console.log('--    Debug    --');
    console.dir(race);
    console.dir(pclass);
  }

  function logIt(number) {
    console.log('logit: ' + number);
    return number;
  }

  return (
    <section className="grid border-2 border-black sm:grid-cols-2 md:grid-cols-3">
      {/* Selectinput Row */}
      <div className="grid md:grid-cols-2 col-span-full">
        <div className="grid p-4">
          <input
            type="text"
            name="pcname"
            defaultValue="---"
            className="w-full border border-black rounded"
          />
          <p>Name</p>
        </div>
        <div className="grid grid-cols-3 gap-2 p-4">
          <div className="grid">
            <select name="playerclass" onChange={handleClassSelect}>
              {labels &&
                labels.classes.map((pclass, i) => (
                  <option value={i} key={i}>
                    {pclass[0]}
                  </option>
                ))}
            </select>
            <p>Class</p>
          </div>
          <div className="grid">
            <select
              name="playersubclass"
              onChange={handleSubclassSelect}
            >
              {subclassLabels &&
                subclassLabels.map((sub, i) => (
                  <option value={sub} key={i}>
                    {sub}
                  </option>
                ))}
            </select>
            <p>Subclass</p>
          </div>
          <div className="grid">
            <input
              type="range"
              name="pclevel"
              defaultValue="1"
              min="1"
              max="20"
              className="w-full border border-black rounded"
              onChange={updateLevel}
            />
            <p>Level: {level}</p>
          </div>
          <div className="grid">
            <select name="playerrace" onChange={handleRaceSelect}>
              {labels &&
                labels.races.map((prace, i) => (
                  <option value={i} key={i}>
                    {prace[0]}
                  </option>
                ))}
            </select>
            <p>Race</p>
          </div>
          <div className="grid">
            <select
              name="playersubrace"
              onChange={handleSubraceSelect}
            >
              {subraceLabels &&
                subraceLabels.map((sub, i) => (
                  <option value={sub} key={i}>
                    {sub}
                  </option>
                ))}
            </select>
            <p>Subrace</p>
          </div>
          <div className="grid">
            <select name="playerbg" onChange={handleBackgroundSelect}>
              {labels &&
                labels.backgrounds.map((pbg, i) => (
                  <option value={pbg} key={i}>
                    {pbg}
                  </option>
                ))}
            </select>
            <p>Background</p>
          </div>
        </div>
        <div className="grid grid-cols-2">
          <div className="col-span-full">Stats</div>
          <div className="grid col-start-1">
            <button
              type="button"
              onClick={randomStats}
              className="font-bold text-white bg-emerald-600"
            >
              Random
            </button>
            <button
              type="button"
              onClick={flatStats}
              className="font-bold text-white border-t border-b border-green-700 bg-emerald-600"
            >
              Flat
            </button>
            <button
              type="button"
              onClick={openPointBuy}
              className="font-bold text-white bg-emerald-600"
            >
              Point Buy
            </button>
            <button
              type="button"
              onClick={openRollStats}
              className="font-bold text-white bg-emerald-600"
            >
              Roll Stats
            </button>
            <button
              className="font-bold text-white border border-blue-500 rounded-md bg-emerald-600"
              onClick={runDebug}
            >
              Debug
            </button>
          </div>
        </div>
      </div>

      {/* Stats Column*/}
      <div className="grid grid-cols-[1fr_2fr] text-center gap-2">
        {/* Base Stats */}
        <div className="grid gap-2 bg-gray-100">
          {stats.map((stat, i) => (
            <Statframe
              stat={stat}
              key={i}
              mod={getMod(stat)}
              dex={i}
            />
          ))}
        </div>

        {/* Proficiencies */}
        <div className="grid gap-2 grid-rows-10">
          <div className="grid grid-cols-[1fr_3fr] border border-blue-800 rounded-md">
            <p>{Math.ceil(level * 0.25) + 1}</p>
            <p>Proficiency Bonus</p>
          </div>
          <div className="row-span-2 bg-blue-200">
            <p className="font-bold">Saving Throws</p>
            {pclass.saving_throws &&
              pclass.saving_throws.map((x, i) => (
                <div
                  key={i}
                  className="grid grid-cols-[1fr_3rem] text-center px-2 gap-2"
                >
                  <p>{statnames[x]}</p>
                  <p>
                    {signed(
                      getMod(stats[x]) + Math.ceil(level * 0.25) + 1
                    )}
                  </p>
                </div>
              ))}
          </div>
          <div className="bg-green-200 row-span-8">
            <p className="font-bold">Skill Proficiencies</p>
            {proficiency_data.map((pname, i) => (
              <Profpane
                name={pname[0]}
                key={i}
                profmod={Math.ceil(level * 0.25) + 1}
                statmod={getMod(stats[pname[1]])}
                proficient={proficiencies[i]}
              />
            ))}
          </div>
        </div>
        <div className="grid grid-cols-[1fr_3fr] col-span-2 border border-blue-800 rounded-md">
          <p>
            {10 + getMod(stats[4]) + (Math.ceil(level * 0.25) + 1)}
          </p>
          <p>Passive Perception</p>
        </div>
        <div className="flex items-center justify-center col-span-2 min-h-[12rem] bg-red-100">
          <p>Other Skills and Languages</p>
        </div>
      </div>

      {/* Attack Column */}
      <div className="flex flex-col gap-2 text-center">
        <div className="grid grid-cols-3">
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">{10 + getMod(stats[1])}</p>
            <p>AC</p>
          </div>
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">{getMod(stats[1])}</p>
            <p>Initiative</p>
          </div>
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">{race.speed}</p>
            <p>Speed</p>
          </div>
        </div>
        <div className="grid grid-cols-2">
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">
              {Math.floor(pclass.hit_die * 0.75) * level +
                getMod(stats[2]) * level}
            </p>
            <p>HP</p>
          </div>
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold"> d{pclass.hit_die}</p>
            <p>Hit Die</p>
          </div>
        </div>

        <div className="grid gap-2">
          <div className="grid grid-cols-6 gap-2">
            <div className="col-span-3 bg-gray-100">Name</div>
            <div className="bg-gray-100">Bonus</div>
            <div className="col-span-2 bg-gray-100">dmg</div>
          </div>
          <div className="grid grid-cols-6 gap-2">
            <div className="col-span-3 bg-gray-100">!</div>
            <div className="bg-gray-100">!</div>
            <div className="col-span-2 bg-gray-100">!</div>
          </div>
          <div className="grid grid-cols-6 gap-2">
            <div className="col-span-3 bg-gray-100">!</div>
            <div className="bg-gray-100">!</div>
            <div className="col-span-2 bg-gray-100">!</div>
          </div>
          <div className="grid grid-cols-6 gap-2">
            <div className="col-span-3 bg-gray-100">!</div>
            <div className="bg-gray-100">!</div>
            <div className="col-span-2 bg-gray-100">!</div>
          </div>
          <div className="flex justify-center min-h-[22rem] bg-blue-100">
            <p className="self-end text-sm font-bold">
              Attacks and Spellcasting
            </p>
          </div>
        </div>
        <div className="grid grid-cols-[1fr_4fr] min-h-[12rem] bg-teal-100">
          <div className="grid gap-2 text-center bg-gray-100">
            <div className="grid rounded-lg">
              <p>?</p>
              <p className="text-xs">CP</p>
            </div>
            <div className="grid rounded-lg">
              <p>?</p>
              <p className="text-xs">SP</p>
            </div>
            <div className="grid rounded-lg">
              <p>?</p>
              <p className="text-xs">EP</p>
            </div>
            <div className="grid rounded-lg">
              <p>?</p>
              <p className="text-xs">GP</p>
            </div>
            <div className="grid rounded-lg">
              <p>?</p>
              <p className="text-xs">PP</p>
            </div>
          </div>
          <div className="flex p-2"></div>
          <p className="text-sm font-bold col-span-full">Equipment</p>
        </div>
      </div>

      {/* Features Column */}
      <div className="grid gap-2 text-center sm:grid-cols-2 md:grid-cols-1 sm:col-span-full md:col-span-1">
        <div className="grid gap-2 min-h-[50vh] border border-red-300">
          <div className="text-sm font-bold border-2 border-blue-800 rounded-md">
            <p>Traits</p>
          </div>
          <p className="text-sm font-bold border-2 border-blue-800 rounded-md">
            Ideals
          </p>
          <p className="text-sm font-bold border-2 border-blue-800 rounded-md">
            Bonds
          </p>
          <p className="text-sm font-bold border-2 border-blue-800 rounded-md">
            Flaws
          </p>
        </div>
        <div className="grid justify-center bg-emerald-100">
          <p className="self-end text-sm font-bold">
            Features and Abilities
          </p>

          <Armor pclass={pclass} race={race} subclass={subclass} subrace={subrace} level={level} />
          <Weapons pclass={pclass} race={race} subclass={subclass} subrace={subrace} level={level} />

          <div className="grid gap-2 p-2">
            <p className="row-span-2 font-bold">Racial Features:</p>
            {race.features &&
              race.features.map((feat, i) => (
                <p key={i} className="text-start">
                  {feat}
                </p>
              ))}
            <p className="row-span-2 font-bold">Class Features:</p>
            {pclass.features &&
              getLeveledFeatures(pclass.features, level).map(
                (feat, i) => (
                  <p key={i} className="text-start">
                    {feat}
                  </p>
                )
              )}
          </div>
        </div>
      </div>

      {/* Spells Header */}
      <div className="grid md:grid-cols-2 col-span-full">
        <div className="grid p-4">
          <p>?</p>
          <p>Spellcasting Class</p>
        </div>
        <div className="grid grid-cols-3 gap-2 p-4">
          <div className="grid">
            <p>?</p>
            <p>Casting Ability</p>
          </div>
          <div className="grid">
            <p>?</p>
            <p>Save DC</p>
          </div>
          <div className="grid">
            <p>?</p>
            <p>Attack Bonus</p>
          </div>
        </div>
      </div>
      <Pointbuy submit={setStats} />
      <Rollstats submit={setStats} />
    </section>
  );
}
