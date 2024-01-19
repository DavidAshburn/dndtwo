import React from 'react';

function mergeArrays(arr, arrtwo) {
  let obj = {};
  for (let item of arr) {
    obj[item] = 1;
  }
  for (let item of arrtwo) {
    obj[item] = 1;
  }
  return Object.keys(obj);
}
export default function Racialfeatures(props) {
  let extralangs =
    props.race.extra_languages + props.subrace.extra_languages;

  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="racialfeatures"
    >
      <p>{extralangs || ''}</p>
      <button
        className="font-bold bg-white border-2 border-blue-600 rounded-md"
        onClick={props.submit}
      >
        Go
      </button>
    </dialog>
  );
}
