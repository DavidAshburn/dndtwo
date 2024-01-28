import React, { useState } from 'react';
import Dropdown from './selects/Dropdown';

export default function CollatedEquipment({
  equipables,
  cequip,
  submitFunc,
}) {
  if (
    equipables.armor == undefined ||
    equipables.weapons == undefined ||
    equipables.equipment == undefined ||
    equipables.tools == undefined ||
    !cequip
  )
    return <div></div>;

  let simpleweps = equipables.weapons.filter(
    (x) => x.wep_type == 'simple'
  );
  let simpleweplist = simpleweps.map((piece) => piece.name);
  let martialweps = equipables.weapons.filter(
    (x) => x.wep_type == 'martial'
  );
  let martiallist = martialweps.map((piece) => piece.name);
  let artisantools = equipables.tools
    .filter((x) => x.tool_type == 'artisan')
    .map((tool) => tool.name);
  let instruments = equipables.tools
    .filter((x) => x.tool_type == 'instrument')
    .map((tool) => tool.name);

  console.log(cequip);

  /*
    <Dropdown list={simpleweplist} name="Simple Weapons" />
    <Dropdown list={martiallist} name="Martial Weapons" />
    <Dropdown list={artisantools} name="Artisan Tools" />
    <Dropdown list={instruments} name="Instruments" />
  */

  function parseOption(item) {
    let values = item.split('#');
    let menuoption = false;
    let limit = [];
    for (let i = 0; i < parseInt(values[1]); i++) {
      limit.push(1);
    }
    let output = [];
    if (values[0] == 'simple') {
      menuoption == true;
      output.push(
        <div>
          {limit.map((x, i) => (
            <Dropdown
              list={simpleweplist}
              name="Simple Weapon"
              key={i}
            />
          ))}
        </div>
      );
    }
    if (values[0] == 'martial') {
      menuoption == true;
      output.push(
        <div>
          {limit.map((x, i) => (
            <Dropdown
              list={martiallist}
              name="Martial Weapon"
              key={i}
            />
          ))}
        </div>
      );
    }
    if (values[0] == 'artisan') {
      menuoption == true;
      output.push(
        <div>
          {limit.map((x, i) => (
            <Dropdown
              list={artisantools}
              name="Artisan Tools"
              key={i}
            />
          ))}
        </div>
      );
    }
    if (values[0] == 'instrument') {
      menuoption == true;
      output.push(
        <div>
          {limit.map((x, i) => (
            <Dropdown list={instruments} name="Instrument" key={i} />
          ))}
        </div>
      );
    }
    if (!menuoption) {
      output.push(
        <div>
          <p>{values[0]}</p>
          <p>qty: {values[1]}</p>
        </div>
      );
    }
    return output;
  }

  function expandSelects(choice) {
    let output = [];
    for (let item of choice) {
      if (Array.isArray(choice)) {
        for (let item of choice) {
          output.push(parseOption(item));
        }
      } else {
        output.push(parseOption(item));
      }
    }
    return output;
  }

  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="collatedequipment"
    >
      <div className="grid" id="collatedequipmentselects">
        {cequip.choices.map((choice) => (
          <div className="grid grid-cols-2">
            {expandSelects(choice)}
          </div>
        ))}
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
