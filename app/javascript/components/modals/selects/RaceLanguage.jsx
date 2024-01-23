import React from 'react';

function mergeArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;

  let obj = {};
  for (let item of arr) {
    obj[item] = 1;
  }
  for (let item of arrtwo) {
    obj[item] = 1;
  }
  return Object.keys(obj);
}

function subtractArrays(arr, arrtwo) {
  if (arr == null) return [];
  if (arrtwo == null) return arr;
  let output = arr.filter((x) => !arrtwo.includes(x));
  return output;
}

export default function RaceLanguage({ rlang, srlang, extracount }) {
  function languageSelects() {
    let allLanguages = [
      'Common',
      'Dwarvish',
      'Elvish',
      'Giant',
      'Gnomish',
      'Goblin',
      'Halfling',
      'Orc',
      'Abyssal',
      'Celestial',
      'Draconic',
      'Deep Speech',
      'Infernal',
      'Primordial',
      'Sylvan',
      'Tabaxi',
      'Undercommon',
    ];

    let select_boxes = [];
    for (let i = 0; i < extracount; i++) {
      select_boxes.push(
        <select key={i}>
          {subtractArrays(
            allLanguages,
            mergeArrays(rlang, srlang)
          ).map((lang, j) => (
            <option value={lang} key={j}>
              {lang}
            </option>
          ))}
        </select>
      );
    }
    return select_boxes;
  }

  return (
    <div
      className={
        extracount > 0 ? 'grid grid-cols-3 p-2 gap-2' : 'h-0'
      }
      id="raciallanguageselectframe"
    >
      {extracount > 0 && <p>Extra Languages:</p>}
      {languageSelects()}
    </div>
  );
}
