import React from 'react';

function subtractArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;
  let output = arr.filter((x) => !arrtwo.includes(x));
  return output;
}

export default function RaceTools({ toolchoices, takentools }) {
  function toolSelect() {
    let options = subtractArrays(toolchoices, takentools);

    return (
      <select>
        {options.map((tool, j) => (
          <option value={tool} key={j}>
            {tool}
          </option>
        ))}
      </select>
    );
  }

  return (
    <div
      className={
        toolchoices.length > 0 ? 'selectframe' : 'emptyselect'
      }
      id="racialtoolselectframe"
    >
      {toolchoices.length > 0 && <p>Extra Tools:</p>}
      {toolchoices.length > 0 && toolSelect()}
    </div>
  );
}
