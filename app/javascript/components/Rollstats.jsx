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

  let [openvalues, setOpenValues] = useState([]);
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
    setRollValues(roll);
    setOpenValues(roll);
  }, []);

  function updateOpenValues(event) {
    let dex = event.target.value;

    let temp = taken;
    temp[dex] = true;
    setTaken(temp);

    let tempopen = openvalues;
    tempopen[dex] = '---';
    setOpenValues(tempopen);

    let boxes = document.getElementById('selectframe').children;

    for (let box of boxes) {
      box.children[parseInt(dex) + 1].disabled = true;
    }

    //console.log('taken: ' + taken);
    //console.log('open : ' + openvalues);
  }

  console.log('render');

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="rollstats"
    >
      <div className="grid grid-cols-6 gap-2 p-4" id="selectframe">
        <select
          name="str"
          id="rollstr"
          dex={0}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i} disabled={taken[i]}>
              {val}
            </option>
          ))}
        </select>
        <select
          name="dex"
          id="rolldex"
          dex={1}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i}>
              {val}
            </option>
          ))}
        </select>
        <select
          name="con"
          id="rollcon"
          dex={2}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i}>
              {val}
            </option>
          ))}
        </select>
        <select
          name="int"
          id="rollint"
          dex={3}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i}>
              {val}
            </option>
          ))}
        </select>
        <select
          name="wis"
          id="rollwis"
          dex={4}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i}>
              {val}
            </option>
          ))}
        </select>
        <select
          name="cha"
          id="rollcha"
          dex={5}
          onChange={updateOpenValues}
        >
          <option value="none">---</option>
          {openvalues.map((val, i) => (
            <option value={i} key={i}>
              {val}
            </option>
          ))}
        </select>
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
