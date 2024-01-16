import React, { useState } from 'react';

function closeModal(event) {
  document.getElementById('pointbuy').close();
}

export default function Pointbuy(props) {
  let [stats, setStats] = useState([8, 8, 8, 8, 8, 8]);
  let [points, setPoints] = useState(27);
  let [pointsspent, setPointsSpent] = useState([0, 0, 0, 0, 0, 0]);

  let names = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];
  let pointcosts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 7, 9];

  function decStat(event) {
    let statdex = event.target.dataset.dex;
    if (stats[statdex] == 8) return; //won't go below 8

    let spent = pointsspent.map((x) => x);
    spent[statdex] = pointcosts[stats[statdex] - 1];
    setPointsSpent(spent);

    let sum = spent.reduce((sum, val) => sum + val, 0);
    setPoints(27 - sum);

    let temp = stats.map((x) => x);
    temp[statdex]--;
    setStats(temp);
  }

  function incStat(event) {
    let statdex = event.target.dataset.dex;
    if (stats[statdex] == 15) return; //won't go below 8

    let spent = pointsspent.map((x) => x);
    spent[statdex] = pointcosts[stats[statdex] + 1];
    setPointsSpent(spent);

    let sum = spent.reduce((sum, val) => sum + val, 0);
    setPoints(27 - sum);

    let temp = stats.map((x) => x);
    temp[statdex]++;
    setStats(temp);
  }

  function submitStats() {
    if (points > 0) return;
    props.submit(stats);
    closeModal();
  }

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="pointbuy"
    >
      <div className="grid grid-cols-8">
        <p>Points</p>
        <p>{points}</p>
        <p>Spent</p>
        <p>{pointsspent.reduce((sum, val) => sum + val, 0)}</p>
      </div>
      <div className="grid grid-cols-6 gap-2 px-4" id="selectframe">
        {names.map((name, i) => (
          <div
            className="flex gap-2 p-2 text-center items-center rounded-lg border border-black"
            key={i}
          >
            <p
              onClick={decStat}
              data-dex={i}
              className="rounded-full bg-gray-200 text-lg px-2"
            >
              {'<'}
            </p>
            <p className="font-bold text-3xl">{stats[i]}</p>
            <p
              onClick={incStat}
              data-dex={i}
              className="rounded-full bg-gray-200 text-lg px-2"
            >
              {'>'}
            </p>
          </div>
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
