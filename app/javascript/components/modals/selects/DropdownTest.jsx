import React from 'react';

export default function DropdownTest({ list, label }) {
  if (!Array.isArray(list) || list.length == 0) return <div></div>;

  return (
    <div className="grid grid-cols-2">
      <p>{label}: </p>

      <select name="label">
        {list.map((item, i) => (
          <option value="item" key={i}>
            {item}
          </option>
        ))}
      </select>
    </div>
  );
}
