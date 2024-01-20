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
  let extralangs =
    race.extra_languages + subrace.extra_languages || 0;

  let toolsets = [
    race.tools || [],
    subrace.tools || [],
    pclass.tools || [],
    subclass.tools || [],
    background.tools || [],
  ];
  let basetools = sumArrays(toolsets);
  let choices = race.tool_choice || [];

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
          {toolSelects(choices, basetools)}
        </div>
      </div>

      <button
        className="font-bold bg-white border-2 border-blue-600 rounded-md"
        onClick={submitFunc}
      >
        Submit
      </button>
      <button
        className="font-bold bg-white border-2 border-blue-600 rounded-md ml-4"
        onClick={debugFunc}
      >
        Test
      </button>
    </dialog>
  );
}
