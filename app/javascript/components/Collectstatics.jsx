import React, { useState } from 'react';

//props.data = array of arrays of strings, no validation just collection
//props.name = string title for data
export default function Collectstatics(props) {
  let obj = {};

  props.data.forEach((x) => {
    if (x) {
      for (let item of x) {
        obj[item] = 1;
      }
    }
  });

  let uniquekeys = Object.keys(obj);

  return (
    <div className="grid grid-cols-4 gap-2">
      <p className="font-bold col-span-full">{props.name}:</p>
      {uniquekeys.map((type, i) => (
        <p key={i}>{type}</p>
      ))}
    </div>
  );
}
