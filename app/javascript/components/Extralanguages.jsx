import React from 'react';

function closeModal() {
  document.getElementById('extralang').close();
}

//props
//submit - setExtraLanguages
//givenlanguages - array of static collections x.languages
//extralanguages - int from sum of x.extra_languages
export default function Extralanguages(props) {
  function getLanguages() {
    let obj = [];
    for (let i = 0; i < props.givenlanguages.length; i++) {
      for (let j = 0; j < props.givenlanguages.length; j++) {
        obj[props.givenlanguages[j]] = 1;
      }
    }

    return Object.keys(obj);
  }

  function extraSelects(taken, limit) {
    let allLanguages = [
      'Common',
      'Elvish',
      'Dwarvish',
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
    let openlanguages = [];

    let alllangs = {};
    for (let item of allLanguages) {
      alllangs[item] = 0;
    }
    for (let item of taken) {
      alllangs[item] = 1;
    }

    for (let [key, value] of Object.entries(alllangs)) {
      if (value == 0) openlanguages.push(key);
    }

    let output = [];
    for (let i = 0; i < limit; i++) {
      output.push(1);
    }
    return output.map((x, i) => (
      <select key={i}>
        {openlanguages.map((x, i) => (
          <option value="x" key={i}>
            {x}
          </option>
        ))}
      </select>
    ));
  }

  let taken_langs = getLanguages();

  return (
    <dialog
      className="border border-black rounded-md bg-gray-300 p-8"
      id="extralanguages"
    >
      <p>Known Languages</p>
      {taken_langs.map((x, i) => (
        <p key={i}>{x}</p>
      ))}

      <p>Extra Languages</p>
      {extraSelects(taken_langs, props.extralanguages)}
    </dialog>
  );
}
