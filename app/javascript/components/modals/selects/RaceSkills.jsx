import React from 'react';

function skillSelects(extra_skills) {
  let profnames = [
    'Acrobatics',
    'Animal Handling',
    'Arcana',
    'Athletics',
    'Deception',
    'History',
    'Insight',
    'Intimidation',
    'Investigation',
    'Medicine',
    'Nature',
    'Perception',
    'Performance',
    'Persuasion',
    'Religion',
    'Sleight of Hand',
    'Stealth',
    'Survival',
  ];

  let select_boxes = [];
  for (let i = 0; i < extra_skills; i++) {
    select_boxes.push(
      <select key={i} defaultValue={i}>
        {profnames.map((name, j) => (
          <option value={j} key={j}>
            {name}
          </option>
        ))}
      </select>
    );
  }
  return select_boxes;
}

export default function RaceSkills({ extra_skills }) {
  return (
    <div
      className={extra_skills > 0 ? 'selectframe' : 'emptyselect'}
      id="racialskillselectframe"
    >
      {extra_skills && <p>Extra Skills:</p>}
      {skillSelects(extra_skills)}
    </div>
  );
}
