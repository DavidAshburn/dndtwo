import React, { useState, useEffect } from 'react';
import Statframe from './Statframe';
import Pointbuy from './Pointbuy';
import Rollstats from './Rollstats';

function getMod(stat) {
  return Math.floor(stat / 2) - 5;
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
    for (let i = 0; i < 5; i++) {
      stats.push(Math.floor(Math.random() * 13 + 8));
    }
    setStats(stats);
  }

  function openPointBuy(event) {
    //show modal component
    document.getElementById('pointbuy').showModal();
  }

  function openRollStats(event) {
    document.getElementById('rollstats').showModal();
  }

  function flatStats(event) {
    setStats([10, 10, 10, 10, 10, 10]);
  }

  //console.log debug information
  function runDebug(event) {
    console.log('--    Debug    --');
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
        <div className="grid grid-cols-2">
          <div className="col-span-full">Stats</div>
          <div className="grid col-start-1">
            <button
              type="button"
              onClick={randomStats}
              className="bg-emerald-600 text-white font-bold"
            >
              Random
            </button>
            <button
              type="button"
              onClick={flatStats}
              className="bg-emerald-600 text-white font-bold border-t border-b border-green-700"
            >
              Flat
            </button>
            <button
              type="button"
              onClick={openPointBuy}
              className="bg-emerald-600 text-white font-bold"
            >
              Point Buy
            </button>
            <button
              type="button"
              onClick={openRollStats}
              className="bg-emerald-600 text-white font-bold"
            >
              Roll Stats
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
      <Pointbuy />
      <Rollstats submit={setStats} />
    </section>
  );
}
