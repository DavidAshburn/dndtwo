import React, { useState } from "react";

export default function Weapons(props) {

  let obj = {};

  if(props.pclass.weapons) {
    for(let item of props.pclass.weapons) {
      obj[item] = 1;
    }
  }
  if(props.race.weapons) {
    for(let item of props.race.weapons) {
      obj[item] = 1;
    }
  }
  if(props.subrace.weapons) {
    for(let item of props.subrace.weapons) {
      obj[item] = 1;
    }
  }
  if(props.subclass.weapons) {
    for(let item of props.subclass.weapons) {
      obj[item] = 1;
    }
  }
  if(props.background.weapons) {
    for(let item of props.background.weapons) {
      obj[item] = 1;
    }
  }
  
  let weaponsout = Object.keys(obj);
  
  return (
    <div className="grid grid-cols-4 gap-2">
      <p className="font-bold col-span-full">Weapons:</p>
      {
        weaponsout.map((type, i) => (
          <p key={i}>{type}</p>
        ))
      }
    </div>
  )
}