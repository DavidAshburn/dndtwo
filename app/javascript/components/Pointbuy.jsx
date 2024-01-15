import React, { useState } from 'react';

function closeModal(event) {
  document.getElementById('pointbuy').close();
}

export default function Pointbuy() {
  let [str, setStr] = useState('-');
  let [dex, setDex] = useState('-');
  let [con, setCon] = useState('-');
  let [int, setInt] = useState('-');
  let [wis, setWis] = useState('-');
  let [cha, setCha] = useState('-');

  let [points, setPoints] = useState(27);

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="pointbuy"
    >
      <div className="grid gap-2"></div>
      <button
        className="rounded-md bg-white border-2 border-blue-600 font-bold"
        onClick={closeModal}
      >
        Close
      </button>
    </dialog>
  );
}
