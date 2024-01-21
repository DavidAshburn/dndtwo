import React from 'react';

let list = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

function getMod(stat) {
  return Math.floor(stat / 2) - 5;
}
function signed(number) {
  if (number > 0) return '+' + number;
  return number;
}

export default function Statframe({ stat, dex }) {
  return (
    <div className="grid grid-rows-[2fr_1fr] border border-blue-700">
      <p className="flex items-center justify-center font-bold text-4xl border border-blue-800">
        {signed(getMod(stat))}
      </p>
      <p className="font-bold border border-blue-800">{stat}</p>
      <p className="text-sm">{list[dex]}</p>
    </div>
  );
}
