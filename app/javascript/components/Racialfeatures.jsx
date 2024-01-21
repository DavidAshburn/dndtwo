import React from 'react';
import Expanditem from './Expanditem';

function mergeArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;

  let obj = {};
  for (let item of arr) {
    obj[item] = 1;
  }
  for (let item of arrtwo) {
    obj[item] = 1;
  }
  return Object.keys(obj);
}

function sumArrays(arr) {
  let first = arr.shift();

  while (arr.length > 0) {
    first = mergeArrays(first, arr.shift());
  }
  return first;
}

function subtractArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;
  let output = arr.filter((x) => !arrtwo.includes(x));
  return output;
}

function languageSelects(count, rlangs, srlangs) {
  let allLanguages = [
    'Common',
    'Dwarvish',
    'Elvish',
    'Giant',
    'Gnomish',
    'Goblin',
    'Halfling',
    'Orc',
    'Abyssal',
    'Celestial',
    'Draconic',
    'Deep Speech',
    'Infernal',
    'Primordial',
    'Sylvan',
    'Tabaxi',
    'Undercommon',
  ];

  let racialLanguages = mergeArrays(rlangs, srlangs);

  let counter = [];
  for (let i = 0; i < count; i++) {
    counter.push(1);
  }

  return counter.map((x, i) => (
    <select key={i}>
      {subtractArrays(allLanguages, racialLanguages).map(
        (lang, j) => (
          <option value={lang} key={j}>
            {lang}
          </option>
        )
      )}
    </select>
  ));
}

function toolSelects(choices, takentools) {
  let options = subtractArrays(choices, takentools);
  let counter = [];
  if (choices[0]) {
    return (
      <select>
        {options.map((tool, j) => (
          <option value={tool} key={j}>
            {tool}
          </option>
        ))}
      </select>
    );
  } else {
    return null;
  }
}

function asiSelects(extra_asi) {
  let statnames = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

  let counter = [];
  for (let i = 0; i < extra_asi; i++) {
    counter.push(1);
  }

  if (extra_asi > 0) {
    return counter.map((x, i) => (
      <select key={i} defaultValue={i}>
        {statnames.map((name, j) => (
          <option value={j} key={j}>
            {name}
          </option>
        ))}
      </select>
    ));
  } else {
    return null;
  }
}

function skillSelects(extra_skills) {
  if (extra_skills < 1) return null;

  let profnames = [
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

  let counter = [];
  for (let i = 0; i < extra_skills; i++) {
    counter.push(1);
  }

  return counter.map((x, i) => (
    <select key={i}>
      {profnames.map((name, j) => (
        <option value={j} key={j}>
          {name}
        </option>
      ))}
    </select>
  ));
}

function debugFunc() {
  console.log('debug');
}

export default function Racialfeatures({
  race,
  subrace,
  pclass,
  subclass,
  background,
  submitFunc,
}) {
  let extralangs = race.extra_languages + subrace.extra_languages;

  let toolsets = [
    race.tools,
    subrace.tools,
    pclass.tools,
    subclass.tools,
    background.tools,
  ];

  let takentools = sumArrays(toolsets);
  let choices = race.tool_choice || [];

  let extra_asi = race.extra_asi;
  let extra_skills = race.extra_skills;

  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="racialfeatures"
    >
      <div className="grid" id="rfmodalmain">
        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="raciallanguageselectframe"
        >
          {extralangs ? <p>Extra Languages:</p> : <></>}
          {languageSelects(
            extralangs,
            race.languages,
            subrace.languages
          )}
        </div>

        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="racialtoolselectframe"
        >
          {choices.length > 0 ? <p>Extra Tools:</p> : <></>}
          {toolSelects(choices, takentools)}
        </div>
        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="racialasiselectframe"
        >
          {extra_asi ? <p>+1 to Stats:</p> : <></>}
          {asiSelects(extra_asi)}
        </div>
        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="racialskillselectframe"
        >
          {extra_skills ? <p>Extra Skills:</p> : <></>}
          {skillSelects(extra_skills)}
        </div>
      </div>

      <button
        className="font-bold bg-white border-2 border-blue-600 rounded-md"
        onClick={submitFunc}
      >
        Submit
      </button>
    </dialog>
  );
}

//may want to set a flag on the submit button that resets when menu items change
//if there are no changes, rerun submit function whenever stats are changed

//alternatively, think about when we should call different setStat methods around the app
