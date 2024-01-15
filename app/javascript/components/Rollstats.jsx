import React, { useState, useEffect } from 'react';
import Rollselect from './Rollselect';

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

  let names = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

  useEffect(() => {
    let roll = rollStats();
    setOpenValues(roll);
  }, []);

  function updateTaken(event) {
    //cleanup
    if (event.target.lastvalue != 99) {
      let temp = taken;
      temp[event.target.lastvalue] = false;
      setTaken(temp);
    }
    event.target.lastvalue = event.target.value;

    //disable choice across Rollinputs
    let dex = event.target.value;

    let temp = taken;
    temp[dex] = true;
    setTaken(temp);
  }

  console.log('render');

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="rollstats"
    >
      <div className="grid grid-cols-6 gap-2 p-4" id="selectframe">
        {names.map((name, i) => {
          <Rollselect
            key={i}
            name={name}
            onChange={updateTaken}
            taken={taken}
            values={rollvalues}
            lastval={99}
          />;
        })}
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
