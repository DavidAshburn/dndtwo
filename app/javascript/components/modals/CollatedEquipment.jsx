import React, { useState } from 'react';
import DropdownTest from './selects/DropdownTest';

export default function CollatedEquipment({
  equipables,
  cequip,
  submitFunc,
}) {
  if (
    equipables.armor == undefined ||
    equipables.weapons == undefined ||
    equipables.equipment == undefined ||
    equipables.tools == undefined
  )
    return <div></div>;

  let armorlist = equipables.armor.map((piece) => piece.name);
  let weaponlist = equipables.weapons.map((piece) => piece.name);
  let simpleweps = equipables.weapons.filter(
    (x) => x.wep_type == 'simple'
  );
  let simpleweplist = simpleweps.map((piece) => piece.name);
  if (simpleweps.length == 0) simpleweplist.push('None');

  let martialweps = equipables.weapons.filter(
    (x) => x.wep_type == 'martial'
  );

  let martiallist = martialweps.map((piece) => piece.name);
  if (martialweps.length == 0) martiallist.push('None');

  let equipmentlist = equipables.equipment.map((piece) => piece.name);
  let toollist = equipables.tools.map((piece) => piece.name);

  console.log(cequip);

  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="collatedequipment"
    >
      <div className="grid">
        <DropdownTest list={armorlist} name="Armor" />
        <DropdownTest list={simpleweplist} name="Simple Weapons" />
        <DropdownTest list={martiallist} name="Martial Weapons" />
        <DropdownTest list={equipmentlist} name="Equipment" />
        <DropdownTest list={toollist} name="Tools" />
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
