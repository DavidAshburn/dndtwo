import React, { useState } from 'react';

export default function CollatedEquipment({ submitFunc }) {
  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="collatedequipment"
    >
      <div className="grid">
        <p>Equipment</p>
        <p>Other stuff</p>
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
