import React from 'react';

export default function Dropdown({ list, name }) {
  if (!Array.isArray(list) || list.length == 0) return <div></div>;

  return (
    <div className="grid grid-cols-2">
      <p>{name}: </p>

      <select name="name" defaultValue={list[0]}>
        {list.map((item, i) => (
          <option value={item} key={i}>
            {item}
          </option>
        ))}
      </select>
    </div>
  );
}
