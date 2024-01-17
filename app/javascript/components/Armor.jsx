import React, { useState } from "react";

export default function Armor(props) {

  let obj = {};

  if(props.pclass.armor) {
    for(let item of props.pclass.armor) {
      obj[item] = 1;
    }
  }
  if(props.race.armor) {
    for(let item of props.race.armor) {
      obj[item] = 1;
    }
  }
  if(props.subrace.armor) {
    for(let item of props.subrace.armor) {
      obj[item] = 1;
    }
  }
  if(props.subclass.armor) {
    for(let item of props.subclass.armor) {
      obj[item] = 1;
    }
  }
  if(props.background.armor) {
    for(let item of props.background.armor) {
      obj[item] = 1;
    }
  }
  
  let armorout = Object.keys(obj);
  
  return (
    <div className="grid grid-cols-4 gap-2">
      <p className="font-bold col-span-full">Armor:</p>
      {
        armorout.map((type, i) => (
          <p key={i}>{type}</p>
        ))
      }
    </div>
  )
}