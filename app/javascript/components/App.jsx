import React, { useState, useEffect } from 'react';
import Statframe from './Statframe';
import Pointbuy from './Pointbuy';
import Rollstats from './Rollstats';
import Profpane from './Profpane';
import Features from './Features';
import Collectstatics from './Collectstatics';
import Racialfeatures from './modals/Racialfeatures';
import Classfeatures from './modals/Classfeatures';
import TestComponent from './TestComponent';
import CollatedEquipment from './modals/CollatedEquipment';

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

  //preloaded data
  let [equipables, setEquipables] = useState({});
  let [allspells, setAllSpells] = useState([]);

  //set by stat methods
  let [stats, setStats] = useState([8, 8, 8, 8, 8, 8]);
  let [rasi, setRASI] = useState([0, 0, 0, 0, 0, 0]);
  let [srasi, setSRASI] = useState([0, 0, 0, 0, 0, 0]);
  let [casi, setCASI] = useState([0, 0, 0, 0, 0, 0]);

  let [level, setLevel] = useState(1);
  let [race, setRace] = useState({});
  let [subrace, setSubrace] = useState({});
  let [pclass, setPClass] = useState({});
  let [subclass, setSubclass] = useState({});
  let [background, setBackground] = useState({});

  //PC state variable storage
  //0 - none, 1 - proficient, 2 - expertise
  let [proficiencies, setProficiencies] = useState([
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ]);
  let [raceproficiencies, setRaceProficiencies] = useState([
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ]);
  let [classproficiencies, setClassProficiencies] = useState([
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ]);
  let [bgproficiencies, setBGProficiencies] = useState([
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ]);

  let [extralanguages, setExtraLanguages] = useState([]);
  let [extratools, setExtraTools] = useState([]);
  let [classskills, setClassSkills] = useState([]);
  let [classleveledchoices, setClassLeveledChoices] = useState([]);

  //equipment choices
  let [classequipment, setClassEquipment] = useState([]);
  let [subclassequipment, setSubclassEquipment] = useState([]);
  let [backgroundequipment, setBackgroundEquipment] = useState([]);

  //data resources-----------------------------------------------------//
  const statnames = [
    'Strength',
    'Dexterity',
    'Constitution',
    'Intelligence',
    'Wisdom',
    'Charisma',
  ];
  //matches proficiency to their source stat for base modifier values
  const proficiency_data = [
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
  const skillnames = [
    'Acrobatics',
    'Animal Handling',
    'Arcana',
    'Athletics',
    'Deception',
    'History',
    'Insight',
    'Intimidation',
    'Investigation',
    'Medicine',
    'Nature',
    'Perception',
    'Performance',
    'Persuasion',
    'Religion',
    'Sleight of Hand',
    'Stealth',
    'Survival',
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

    function loadAllSpells(data) {
      setAllSpells(data);
    }
    function loadEquipables(data) {
      setEquipables(data);
    }

    fetch(`/labels/dropdowns`)
      .then((response) => response.json())
      .then((data) => loadDropdownLabels(data));

    fetch(`/datasets/equipables`)
      .then((response) => response.json())
      .then((data) => loadEquipables(data));

    fetch(`/datasets/spells`)
      .then((response) => response.json())
      .then((data) => loadAllSpells(data));
  }, []);

  //once labels are pulled we initialize the character with load functions to capture modifications
  function initPC() {
    function setInit(data) {
      loadRace(data.pcrace);
      loadSubrace(data.subrace);
      loadClass(data.pclass);
      loadSubclass(data.subclass);
      loadBackground(data.background);
    }

    fetch(`/labels/initPC`)
      .then((response) => response.json())
      .then((data) => setInit(data));
  }

  //fetch data into state - called from onChange functions in dropdowns
  function loadClass(name) {
    fetch(`/player_classes/` + name)
      .then((response) => response.json())
      .then((data) => {
        setPClass(data);
        //reset skills

        setClassProficiencies([
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ]);
      });
  }
  function loadSubclass(name) {
    fetch(`/subclasses/` + name)
      .then((response) => response.json())
      .then((data) => setSubclass(data));
  }
  function loadRace(name) {
    fetch(`/races/` + name)
      .then((response) => response.json())
      .then((data) => {
        setRace(data);
        //ASI adjustent to rasi
        setRASI(data.asi);
        //racial skills
        let indexes = [];
        data.skills.forEach((skill) => {
          indexes.push(skillnames.indexOf(skill));
        });
        let base = [
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ];
        for (let item of indexes) {
          base[item] += 1;
        }
        setRaceProficiencies(base);
      });
  }
  function loadSubrace(name) {
    fetch(`/subraces/` + name)
      .then((response) => response.json())
      .then((data) => {
        setSubrace(data);
        //ASI adjustment to srasi
        setSRASI(data.asi);
      });
  }
  function loadBackground(name) {
    fetch(`/backgrounds/` + name)
      .then((response) => response.json())
      .then((data) => {
        setBackground(data);
        //background skills
        let indexes = [];
        data.skills.forEach((skill) => {
          indexes.push(skillnames.indexOf(skill));
        });
        let base = [
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        ];
        for (let item of indexes) {
          base[item] += 1;
        }
        setBGProficiencies(base);
      });
  }

  //onChange functions in dropdowns
  function handleClassSelect(event) {
    let dex = event.target.value;
    setSubclassLabels(labels.classes[dex][1]);

    loadClass(labels.classes[dex][0]);
    loadSubclass('None');
    document.getElementById('subclassselect').value = 'None';
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
    document.getElementById('subraceselect').value = firstSubraceName;
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
  function openPointBuy() {
    document.getElementById('pointbuy').showModal();
  }
  function openRollStats() {
    document.getElementById('rollstats').showModal();
  }
  function flatStats(event) {
    let stats = [10, 10, 10, 10, 10, 10];
    setStats(stats);
  }

  //Menu modal buttons
  function openRacialFeatures() {
    document.getElementById('racialfeatures').showModal();
  }
  function openClassFeatures() {
    document.getElementById('classfeatures').showModal();
  }
  function openCollatedEquipment() {
    document.getElementById('collatedequipment').showModal();
  }

  //Modal Submit Handlers
  function handleRacialFeatures(event) {
    let modalframe = document.getElementById('racialfeatures');
    //languages
    let langframe = document.getElementById(
      'raciallanguageselectframe'
    );
    let takenlangs = [];
    let i = 0;
    for (let item of langframe.children) {
      if (i > 0) takenlangs.push(item.value);
      i++;
    }
    setExtraLanguages(takenlangs);

    let toolframe = document.getElementById('racialtoolselectframe');
    let takentools = [];
    i = 0;
    for (let item of toolframe.children) {
      if (i > 0) takentools.push(item.value);
      i++;
    }
    setExtraTools(takentools);

    let asiframe = document.getElementById('racialasiselectframe');
    let takenasi = [0, 0, 0, 0, 0, 0];
    i = 0;
    for (let item of asiframe.children) {
      if (i > 0) takenasi[item.value] += 1;
      i++;
    }
    //ASI adjustment
    setCASI(takenasi);

    let skillframe = document.getElementById(
      'racialskillselectframe'
    );
    let takenskills = [];
    i = 0;
    for (let item of skillframe.children) {
      if (i > 0) takenskills.push(item.value);
      i++;
    }
    let newprofs = [
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ];
    for (let val of takenskills) {
      if (newprofs[val] == 0) newprofs[val]++;
    }
    setRaceProficiencies(newprofs);

    modalframe.close();
  }
  function handleClassFeatures(event) {
    let modalframe = document.getElementById('classfeatures');
    let i = 0;

    //class skills
    let skillframe = document.getElementById('classskillselectframe');
    let takenskills = [];
    i = 0;
    for (let item of skillframe.children) {
      if (i > 0) takenskills.push(item.value);
      i++;
    }
    let newprofs = [
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ];
    for (let val of takenskills) {
      if (newprofs[val] == 0) newprofs[val]++;
    }
    setClassProficiencies(newprofs);

    let leveledchoices = document
      .getElementById('classleveledchoiceframe')
      ?.getElementsByTagName('input');

    let selectedchoices = [];
    for (let input of leveledchoices) {
      if (input.checked) selectedchoices.push(input.dataset.return);
    }
    setClassLeveledChoices(selectedchoices);

    modalframe.close();
  }
  function handleCollatedEquipment(event) {
    let modalframe = document.getElementById('collatedequipment');
    let equipselects = document.getElementById(
      'collatedequipmentselects'
    );
    let selects = equipselects.getElementsByTagName('select');

    console.log(selects);

    let output = [];
    for (let item of selects) {
      output.push(item.value);
    }
    console.log(output);
    modalframe.close();
  }

  //Debug Methods
  function runDebug(event) {
    console.log('--    Debug 2   --');
    console.log(pclass);
    /*
    fetch(`/player_classes/index`)
      .then((response) => response.json())
      .then((data) => debugData(data));
      */
  }

  function debugData(data) {
    let customs = [];
    for (let dat of data) {
      customs.push([dat.name, dat.leveled_choice]);
    }
    console.log('leveled choices');
    for (let item of customs) {
      console.log(item[0]);
      console.log(item[1]);
    }
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
              {labels.classes?.map((pclass, i) => (
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
              id="subclassselect"
            >
              {subclassLabels?.map((sub, i) => (
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
              {labels.races?.map((prace, i) => (
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
              id="subraceselect"
            >
              {subraceLabels?.map((sub, i) => (
                <option value={sub} key={i}>
                  {sub}
                </option>
              ))}
            </select>
            <p>Subrace</p>
          </div>
          <div className="grid">
            <select name="playerbg" onChange={handleBackgroundSelect}>
              {labels.backgrounds?.map((pbg, i) => (
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
          <div className="grid">
            <button
              type="button"
              onClick={openRacialFeatures}
              className="font-bold text-white bg-emerald-600"
            >
              Racial Features
            </button>
            <button
              type="button"
              onClick={openClassFeatures}
              className="font-bold text-white bg-emerald-600"
            >
              Class Features
            </button>
            <button
              type="button"
              onClick={openCollatedEquipment}
              className="font-bold text-white bg-emerald-600"
            >
              Equipment
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
              stat={stats[i] + casi[i] + rasi[i] + srasi[i]}
              dex={i}
              key={i}
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
            {pclass.saving_throws?.map((x, i) => (
              <div
                key={i}
                className="grid grid-cols-[1fr_3rem] text-center px-2 gap-2"
              >
                <p>{statnames[x]}</p>
                <p>
                  {signed(
                    getMod(stats[i] + casi[i] + rasi[i] + srasi[i]) +
                      Math.ceil(level * 0.25) +
                      1
                  )}
                </p>
              </div>
            ))}
          </div>
          <div className="bg-green-200 row-span-8">
            <p className="font-bold">Skill Proficiencies</p>
            {proficiency_data.map((pname, i) => (
              <Profpane
                key={i}
                name={pname[0]}
                index={i} //index within proficiencies state
                profmod={Math.ceil(level * 0.25) + 1}
                statmod={getMod(
                  stats[pname[1]] +
                    casi[pname[1]] +
                    rasi[pname[1]] +
                    srasi[pname[1]]
                )}
                bprof={proficiencies}
                rprof={raceproficiencies}
                cprof={classproficiencies}
                bgprof={bgproficiencies}
              />
            ))}
          </div>
        </div>
        <div className="grid grid-cols-[1fr_3fr] col-span-2 border border-blue-800 rounded-md">
          <p>
            {10 +
              getMod(stats[4] + casi[4] + rasi[4] + srasi[4]) +
              (Math.ceil(level * 0.25) + 1)}
          </p>
          <p>Passive Perception</p>
        </div>
        <div className="grid items-center justify-center col-span-2 min-h-[12rem] bg-red-100">
          <p>Other Skills and Languages</p>
          <Collectstatics
            data={[
              pclass.armor,
              race.armor,
              subclass.armor,
              subrace.armor,
              background.armor,
            ]}
            name="Armor"
          />
          <Collectstatics
            data={[
              pclass.weapons,
              race.weapons,
              subclass.weapons,
              subrace.weapons,
              background.weapons,
            ]}
            name="Weapons"
          />
          <Collectstatics
            data={[
              race.tools,
              subrace.tools,
              pclass.tools,
              subclass.tools,
              extratools,
            ]}
            name="Tools"
          />
          <Collectstatics
            data={[
              race.languages,
              subrace.languages,
              subclass.languages,
              extralanguages,
            ]}
            name="Languages"
          />
        </div>
      </div>

      {/* Attack Column */}
      <div className="flex flex-col gap-2 text-center">
        <div className="grid grid-cols-3">
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">
              {10 + getMod(stats[1] + casi[1] + rasi[1] + srasi[1])}
            </p>
            <p>AC</p>
          </div>
          <div className="p-2 text-lg border-2 border-blue-700 h-fit">
            <p className="font-bold">
              {getMod(stats[1] + casi[1] + rasi[1] + srasi[1])}
            </p>
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
              {Math.floor((pclass.hit_die || 10) * 0.75) * level +
                getMod(stats[2] + casi[2] + rasi[2] + srasi[2]) *
                  level}
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
          <Features
            pclass={pclass}
            race={race}
            subclass={subclass}
            subrace={subrace}
            background={background}
            classleveledchoices={classleveledchoices}
            level={level}
          />
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

      {/* Modal Components */}
      <Pointbuy submit={setStats} />
      <Rollstats submit={setStats} />
      <Racialfeatures
        race={race}
        subrace={subrace}
        pclass={pclass}
        subclass={subclass}
        background={background}
        submitFunc={handleRacialFeatures}
      />
      <Classfeatures
        pclass={pclass}
        subclass={subclass}
        level={level}
        submitFunc={handleClassFeatures}
      />
      <CollatedEquipment
        equipables={equipables}
        cequip={pclass.equipment_choices}
        submitFunc={handleCollatedEquipment}
      />
    </section>
  );
}
