import React from 'react';
import RaceLanguage from './selects/RaceLanguage.jsx';
import RaceTools from './selects/RaceTools.jsx';

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

function asiSelects(extra_asi) {
  let statnames = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

  let select_boxes = [];
  for (let i = 0; i < extra_asi; i++) {
    select_boxes.push(
      <select key={i} defaultValue={i}>
        {statnames.map((name, j) => (
          <option value={j} key={j}>
            {name}
          </option>
        ))}
      </select>
    );
  }
  return select_boxes;
}

function skillSelects(extra_skills) {
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

  let select_boxes = [];
  for (let i = 0; i < extra_skills; i++) {
    select_boxes.push(
      <select key={i}>
        {profnames.map((name, j) => (
          <option value={j} key={j}>
            {name}
          </option>
        ))}
      </select>
    );
  }
  return select_boxes;
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
  let toolsets = [
    race.tools,
    subrace.tools,
    pclass.tools,
    subclass.tools,
    background.tools,
  ];

  let takentools = sumArrays(toolsets);
  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="racialfeatures"
    >
      <div className="grid" id="rfmodalmain">
        <RaceLanguage
          racelang={race.languages}
          sracelang={subrace.languages}
          extracount={race.extra_languages + subrace.extra_languages}
        />
        <RaceTools
          toolchoices={race.tool_choice}
          toolsets={toolsets}
        />

        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="racialasiselectframe"
        >
          {race.extra_asi && <p>+1 to Stats:</p>}
          {asiSelects(race.extra_asi)}
        </div>
        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="racialskillselectframe"
        >
          {race.extra_skills && <p>Extra Skills:</p>}
          {skillSelects(race.extra_skills)}
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

//reworked modstats, racial asi not preserved when rerolling,
//though asi racial selections are preserved
//i think i need some function to collect all statmods together and
//run it when stats are recalculated for any reason
