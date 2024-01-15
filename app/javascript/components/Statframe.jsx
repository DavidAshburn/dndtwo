import React from 'react';

let list = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];
export default function Statframe(props) {
  return (
    <div className="grid grid-rows-[2fr_1fr] border border-blue-700">
      <p className="flex items-center justify-center font-bold text-4xl border border-blue-800">
        {(props.mod < 1 ? '' : '+') + props.mod}
      </p>
      <p className="font-bold border border-blue-800">{props.stat}</p>
      <p className="text-sm">{list[props.dex]}</p>
    </div>
  );
}
