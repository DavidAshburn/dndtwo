import React from 'react';

function sumArrays(arr) {
  let first = arr.shift();

  while (arr.length > 0) {
    first = mergeArrays(first, arr.shift());
  }
  return first;
}
function subtractArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;
  let output = arr.filter((x) => !arrtwo.includes(x));
  return output;
}

export default function RaceTools({ toolchoices, toolsets }) {
  let takentools = sumArrays(toolsets);

  function toolSelect() {
    let options = subtractArrays(toolchoices, sumArrays(toolsets));

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
      className={toolchoices ? 'grid grid-cols-3 p-2 gap-2' : 'h-0'}
      id="racialtoolselectframe"
    >
      {toolchoices && toolchoices.length > 0 && <p>Extra Tools:</p>}
      {toolchoices && toolSelect()}
    </div>
  );
}
