import React from 'react';

function asiSelects(extra_asi) {
  let statnames = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

  let select_boxes = [];
  for (let i = 0; i < extra_asi; i++) {
    select_boxes.push(
      <select key={i} defaultValue={i}>
        {statnames.map((name, j) => (
          <option value={j} key={j}>
            {name}
          </option>
        ))}
      </select>
    );
  }
  return select_boxes;
}

export default function RaceASI({ extra_asi }) {
  return (
    <div
      className={extra_asi ? 'selectframe' : 'emptyselect'}
      id="racialasiselectframe"
    >
      {extra_asi && <p>+1 to Stats:</p>}
      {asiSelects(extra_asi)}
    </div>
  );
}
