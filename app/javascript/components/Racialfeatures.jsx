import React from "react";

export default function Racialfeatures(props) {

  let extralangs = props.race.extra_languages;

  return (
    <dialog className="p-8 bg-gray-300 border border-black rounded-md" id="racialfeatures">
      <p>{extralangs}</p>
      <button className="font-bold bg-white border-2 border-blue-600 rounded-md" onClick={props.submit}>Go</button>
    </dialog>
  )
}