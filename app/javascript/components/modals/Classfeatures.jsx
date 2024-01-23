import React, { useState } from 'react';

function classSkillSelects(extra_skills, skill_list) {
  if (!extra_skills || extra_skills < 1) return null;

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
  let skill_map = skill_list.map((x) => [x, profnames.indexOf(x)]);

  let select_boxes = [];
  for (let i = 0; i < extra_skills; i++) {
    select_boxes.push(
      <select key={i} defaultValue={skill_map[i][1]}>
        {skill_map.map((item, j) => (
          <option value={item[1]} key={j}>
            {item[0]}
          </option>
        ))}
      </select>
    );
  }
  return select_boxes;
}

export default function Classfeatures({
  pclass,
  subclass,
  proficiencies,
  submitFunc,
}) {
  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="classfeatures"
    >
      <div className="grid" id="cfmodalmain">
        <div
          className="grid grid-cols-3 p-2 gap-2"
          id="classskillselectframe"
        >
          {pclass.num_skills > 0 ? <p>Class Skills:</p> : <></>}
          {classSkillSelects(pclass.num_skills, pclass.skill_choices)}
        </div>
      </div>
      <button
        className="font-bold bg-white border-2 border-blue-600 rounded-md"
        onClick={submitFunc}
      >
        Submit
      </button>
    </dialog>
  );
}
