import React, { useState, useEffect } from 'react';

export default function Rollselect(props) {
  return (
    <select name={props.name} onChange={props.callback}>
      <option value="none">---</option>
      {props.values.map((val, i) => (
        <option value={i} key={i} disabled={props.taken[i]}>
          {val}
        </option>
      ))}
    </select>
  );
}
