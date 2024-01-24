import React, { useState } from 'react';
import ClassSkills from './selects/ClassSkills';
import ClassLeveledChoice from './selects/ClassLeveledChoice';

export default function Classfeatures({
  pclass,
  subclass,
  level,
  submitFunc,
}) {
  return (
    <dialog
      className="p-8 bg-gray-300 border border-black rounded-md"
      id="classfeatures"
    >
      <div className="grid" id="cfmodalmain">
        <ClassSkills
          num_skills={pclass.num_skills || 0}
          skill_choices={pclass.skill_choices || []}
        />
        <ClassLeveledChoice
          choiceobject={subclass.leveled_choice}
          level={level}
        />
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

//this is more involved than RaceSkills because theres a given array of skills to choose from
//inside the PlayerClass along with a number the user may choose
