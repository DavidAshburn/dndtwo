import React, { useState, useEffect } from 'react';

function closeModal(event) {
  document.getElementById('rollstats').close();
}

//roll four, drop the lowest, return array of 6 results
function rollStats() {
  function rollSix() {
    return Math.floor(Math.random() * 6 + 1);
  }
  let statlist = [];
  let pile = [];
  let sum = 0;

  for (let i = 0; i < 6; i++) {
    pile = [rollSix(), rollSix(), rollSix(), rollSix()];
    sum =
      pile.reduce(
        (accumulator, currentValue) => accumulator + currentValue,
        0
      ) - Math.min(...pile);
    statlist.push(sum);
  }
  return statlist;
}

export default function Rollstats() {
  let [str, setStr] = useState('-');
  let [dex, setDex] = useState('-');
  let [con, setCon] = useState('-');
  let [int, setInt] = useState('-');
  let [wis, setWis] = useState('-');
  let [cha, setCha] = useState('-');

  let [rollvalues, setRollValues] = useState([]);
  let [taken, setTaken] = useState([
    false,
    false,
    false,
    false,
    false,
    false,
  ]);
  let [prevtaken, setPrevTaken] = useState([99, 99, 99, 99, 99, 99]);

  let [names, setNames] = useState([
    'STR',
    'DEX',
    'CON',
    'INT',
    'WIS',
    'CHA',
  ]);

  useEffect(() => {
    let roll = rollStats();
    setRollValues(roll);
  }, []);

  function updateTaken(event) {
    let selects = document.getElementById('selectframe').children;
    let takendex = event.target.value;

    let prevdex = prevtaken[parseInt(event.target.dataset.dex)];

    let temp = taken;
    if (takendex != 99) temp[takendex] = true;
    temp[prevdex] = false;
    setTaken(temp);

    let ptemp = prevtaken;
    ptemp[parseInt(event.target.dataset.dex)] = event.target.value;
    setPrevTaken(ptemp);

    for (let select of selects) {
      let i = 0;
      for (let child of select.children) {
        if (i > 0) {
          child.disabled = taken[i - 1];
        }
        i++;
      }
    }
  }

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="rollstats"
    >
      <div className="grid grid-cols-6 gap-2 px-4" id="selectframe">
        {names.map((name, i) => (
          <select
            name={name}
            onChange={updateTaken}
            key={i}
            data-dex={i}
          >
            <option value={99}>---</option>
            {rollvalues.map((val, j) => (
              <option value={parseInt(j)} key={j} disabled={false}>
                {val}
              </option>
            ))}
          </select>
        ))}
      </div>
      <div className="grid grid-cols-6 gap-2 px-4">
        {names.map((name, k) => (
          <p key={k}>{name}</p>
        ))}
      </div>
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
