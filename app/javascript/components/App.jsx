import React, { useState, useEffect } from 'react';
import Statframe from './Statframe';

function getMod(stat) {
  return stat + 2;
}

export default function App() {
  let [labels, setLabels] = useState({
    races: [],
    classes: [],
    backgrounds: [],
  });
  //dynamic dropdown content for subclass and subrace - useEffect hook fetches
  let [subclassLabels, setSubclassLabels] = useState(null);
  let [subraceLabels, setSubraceLabels] = useState(null);

  //character traits, pull in full json from db as source of truth - onChange fetches and updates
  let [stats, setStats] = useState([0, 0, 0, 0, 0, 0]);
  let [level, setLevel] = useState(1);
  let [race, setRace] = useState({});
  let [subrace, setSubrace] = useState({});
  let [pclass, setPClass] = useState({});
  let [subclass, setSubclass] = useState({});
  let [background, setBackground] = useState({});

  useEffect(() => {
    fetch(`/labels/dropdowns`)
      .then((response) => response.json())
      .then((data) => handleDropdownLabels(data));
  }, []);

  //once labels are pulled we can call the API for initial pc settings
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

  //called from useEffect to load labels from fetch data
  function handleDropdownLabels(data) {
    setLabels(data);
    setSubclassLabels(data.classes[0][1]);
    setSubraceLabels(data.races[0][1]);
    initPC();
  }

  function initSubclass(name) {
    fetch(`/subclasses/` + name)
      .then((response) => response.json())
      .then((data) => setSubclass(data));
  }

  function initSubrace(name) {
    fetch(`/subraces/` + name)
      .then((response) => response.json())
      .then((data) => setSubrace(data));
  }

  function initBackground() {
    let name = labels.backgrounds[0];
    fetch(`/backgrounds/` + name)
      .then((response) => response.json())
      .then((data) => setBackground(data));
  }

  function handleClassSelect(event) {
    let dex = event.target.value;
    setSubclassLabels(labels.classes[dex][1]);

    let firstSubclassName = labels.classes[dex][1][0];
    initSubclass(firstSubclassName);

    fetch(`/player_classes/` + labels.classes[dex][0])
      .then((response) => response.json())
      .then((data) => setPClass(data));
  }

  function handleSubclassSelect(event) {
    fetch(`/subclasses/` + event.target.value)
      .then((response) => response.json())
      .then((data) => setSubclass(data));
  }

  function handleRaceSelect(event) {
    let dex = event.target.value;
    setSubraceLabels(labels.races[dex][1]);

    let firstSubraceName = labels.races[dex][1][0];
    initSubrace(firstSubraceName);

    fetch(`/races/` + labels.races[dex][0])
      .then((response) => response.json())
      .then((data) => setRace(data));
  }

  function handleSubraceSelect(event) {
    fetch(`/subraces/` + event.target.value)
      .then((response) => response.json())
      .then((data) => setSubrace(data));
  }

  function handleBackgroundSelect(event) {
    fetch(`/backgrounds/` + event.target.value)
      .then((response) => response.json())
      .then((data) => setBackground(data));
  }

  function updateLevel(event) {
    setLevel(event.target.value);
  }

  function runDebug(event) {
    console.log('--    Debug    --');
    console.log(race.name);
    console.log(subrace.name);
    console.log(pclass.name);
    console.log(subclass.name);
    console.log(background.name);
  }

  return (
    <section className="grid sm:grid-cols-2 md:grid-cols-3 border-2 border-black">
      {/* NAME AND BASICS */}
      <div className="grid md:grid-cols-2 col-span-full">
        <div className="grid p-4">
          <input
            type="text"
            name="pcname"
            defaultValue="---"
            className="rounded border border-black w-full"
          />
          <p>Name</p>
        </div>
        <div className="grid grid-cols-3 p-4 gap-2">
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
              className="rounded border border-black w-full"
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
            <button
              className="text-white bg-emerald-600 font-bold rounded-md border border-blue-500"
              onClick={runDebug}
            >
              Debug
            </button>
            <p>Proficiency Bonus</p>
          </div>
          <div className="row-span-3 bg-blue-200">
            <p>Saving Throws</p>
          </div>
          <div className="row-span-7 bg-green-200">
            <p>Skill Proficiencies</p>
          </div>
        </div>
        <div className="grid grid-cols-[1fr_3fr] col-span-2 border border-blue-800 rounded-md">
          <p>?</p>
          <p>Passive Perception</p>
        </div>
        <div className="flex items-center justify-center col-span-2 min-h-[12rem] bg-red-100">
          <p>Other Skills and Languages</p>
        </div>
      </div>

      {/* Attack Column */}
      <div className="flex flex-col text-center gap-2">
        <div className="grid grid-cols-3">
          <div className="border-2 border-blue-700 p-2 text-lg h-fit">
            <p className="font-bold">?</p>
            <p>AC</p>
          </div>
          <div className="border-2 border-blue-700 p-2 text-lg h-fit">
            <p className="font-bold">?</p>
            <p>Initiative</p>
          </div>
          <div className="border-2 border-blue-700 p-2 text-lg h-fit">
            <p className="font-bold">?</p>
            <p>Speed</p>
          </div>
        </div>
        <div className="grid grid-cols-2">
          <div className="border-2 border-blue-700 p-2 text-lg h-fit">
            <p className="font-bold">?</p>
            <p>HP</p>
          </div>
          <div className="border-2 border-blue-700 p-2 text-lg h-fit">
            <p className="font-bold">?</p>
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
            <p className="font-bold text-sm self-end">
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
          <p className="font-bold text-sm col-span-full">Equipment</p>
        </div>
      </div>

      {/* Features Column */}
      <div className="flex flex-col text-center gap-2">
        <div className="grid gap-2 min-h-[50vh] border border-red-300">
          <div className="text-sm font-bold rounded-md border-2 border-blue-800">
            <p>Traits</p>
          </div>
          <p className="text-sm font-bold rounded-md border-2 border-blue-800">
            Ideals
          </p>
          <p className="text-sm font-bold rounded-md border-2 border-blue-800">
            Bonds
          </p>
          <p className="text-sm font-bold rounded-md border-2 border-blue-800">
            Flaws
          </p>
        </div>
        <div className="flex bg-emerald-100 h-full justify-center">
          <p className="text-sm font-bold self-end">
            Features and Abilities
          </p>
        </div>
      </div>

      {/* Spells Header */}
      <div className="grid md:grid-cols-2 col-span-full">
        <div className="grid p-4">
          <p>?</p>
          <p>Spellcasting Class</p>
        </div>
        <div className="grid grid-cols-3 p-4 gap-2">
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
    </section>
  );
}
