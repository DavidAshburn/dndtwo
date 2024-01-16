import React, { useState, useEffect } from 'react';

function closeModal() {
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

export default function Rollstats(props) {
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

  let names = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

  useEffect(() => {
    let roll = rollStats();
    setRollValues(roll);
  }, []);

  function updateTaken(event) {
    let selects = document.getElementById('rollselectframe').children;
    let takendex = event.target.value;

    //dataset.dex tracks which stat the select is controlling
    //that stat is used as the index for prevtaken which stores
    //prevdex, the index of the previously selected option
    let prevdex = prevtaken[parseInt(event.target.dataset.dex)];

    //we set the newly selected option as taken
    //and mark the previous option as untaken
    let temp = taken.map((x) => x);
    if (takendex != 99) temp[takendex] = true;
    temp[prevdex] = false;
    setTaken(temp);

    //update prevtaken at the current stat index with the current taken select option index
    let ptemp = prevtaken.map((x) => x);
    ptemp[parseInt(event.target.dataset.dex)] = event.target.value;
    setPrevTaken(ptemp);
  }

  function submitStats() {
    let stats = [];
    let frame = document.getElementById('rollselectframe');
    for (let child of frame.children) {
      if (child.value != 99) stats.push(rollvalues[child.value]);
    }

    if (stats.length == 6) {
      props.submit(stats);
      closeModal();
    }
  }

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="rollstats"
    >
      <div
        className="grid grid-cols-6 gap-2 px-4"
        id="rollselectframe"
      >
        {names.map((name, i) => (
          <select
            name={name}
            onChange={updateTaken}
            key={i}
            data-dex={i}
          >
            <option value={99}>---</option>
            {rollvalues.map((val, j) => (
              <option value={parseInt(j)} key={j} disabled={taken[j]}>
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
      <button
        className="rounded-md bg-white border-2 border-blue-600 font-bold"
        onClick={submitStats}
      >
        Submit
      </button>
      <button
        className="rounded-md bg-white border-2 border-blue-600 font-bold"
        onClick={closeModal}
      >
        Close
      </button>
    </dialog>
  );
}
