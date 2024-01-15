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

    //cleanup tbw

    for (let select of selects) {
      select.children[parseInt(takendex) + 1].disabled = true;
    }
  }

  console.log('render');

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="rollstats"
    >
      <div className="grid grid-cols-6 gap-2 p-4" id="selectframe">
        {names.map((name, i) => (
          <select name={name} onChange={updateTaken} key={i}>
            <option value="none">---</option>
            {rollvalues.map((val, i) => (
              <option value={i} key={i} disabled={false}>
                {val}
              </option>
            ))}
          </select>
        ))}
      </div>
      <div className="grid">
        <p>{names}</p>
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
