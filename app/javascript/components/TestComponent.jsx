import React, { useState } from 'react';

function getListItems(limit) {
  let output = [];
  for (let i = 0; i < limit; i++) {
    output.push(<p key={i}>item {i}</p>);
  }
  return output;
}
export default function TestComponent({ data }) {
  return (
    <div className="grid gap-2">
      <div className="grid gap-2 p-1">{getListItems(data[0])}</div>
      <div className="grid gap-2 p-1">{getListItems(data[1])}</div>
    </div>
  );
}
