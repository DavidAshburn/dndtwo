import React from 'react';
import Expanditem from '../../Expanditem';

export default function ClassLeveledChoice({ choiceobject, level }) {
  let levelkeys = [];
  console.log(choiceobject);

  return (
    <div>
      {levelkeys.length > 0 ? <p>Optional Features:</p> : <></>}
      <div
        id="classleveledchoiceframe"
        className="grid bg-green-200 h-12"
      >
        <p>Hi</p>
      </div>
    </div>
  );
}
