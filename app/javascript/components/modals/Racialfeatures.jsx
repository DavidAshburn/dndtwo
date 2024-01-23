import React from 'react';
import RaceLanguage from './selects/RaceLanguage.jsx';
import RaceTools from './selects/RaceTools.jsx';
import RaceASI from './selects/RaceASI.jsx';
import RaceSkills from './selects/RaceSkills.jsx';

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
// sums an array of arrays and eliminates duplicates
function sumArrays(arr) {
  let first = arr.shift();

  while (arr.length > 0) {
    first = mergeArrays(first, arr.shift());
  }
  return first;
}

export default function Racialfeatures({
  race,
  subrace,
  pclass,
  subclass,
  background,
  submitFunc,
}) {
  let takentools = sumArrays([
    race.tools,
    subrace.tools,
    pclass.tools,
    subclass.tools,
    background.tools,
  ]);

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
          toolchoices={race.tool_choice || []}
          takentools={takentools}
        />
        <RaceASI extra_asi={race.extra_asi} />
        <RaceSkills extra_skills={race.extra_skills} />
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
