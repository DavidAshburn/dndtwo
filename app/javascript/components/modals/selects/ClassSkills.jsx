import React from 'react';

export default function ClassSkills({ num_skills, skill_choices }) {
  function classSkillSelects() {
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
    let skill_map = skill_choices.map((x) => [
      x,
      profnames.indexOf(x),
    ]);

    let select_boxes = [];
    for (let i = 0; i < num_skills; i++) {
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

  return (
    <div
      className="grid grid-cols-3 p-2 gap-2"
      id="classskillselectframe"
    >
      {num_skills > 0 ? <p>Class Skills:</p> : <></>}
      {classSkillSelects()}
    </div>
  );
}
