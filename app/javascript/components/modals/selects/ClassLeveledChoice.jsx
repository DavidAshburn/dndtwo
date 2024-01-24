import React from 'react';
import Expanditem from '../../Expanditem';

export default function ClassLeveledChoice({
  choiceobject,
  label,
  level,
}) {
  let levelkeys = [];
  if (choiceobject) {
    levelkeys = Object.keys(choiceobject).filter(
      (key) => parseInt(key) <= level
    );
  }

  return (
    <div>
      {levelkeys.length > 0 ? <p>{label}:</p> : <></>}
      <div id="classleveledchoiceframe" className="grid bg-green-200">
        {levelkeys.map((levelkey, i) => (
          <div key={i}>
            {choiceobject[levelkey].map((feature, j) => (
              <div
                key={j}
                className="grid grid-cols-8 border border-black"
              >
                <div className="flex items-center justify-center">
                  <input type="radio" name={j} className="h-4" />
                </div>

                <Expanditem
                  feature={feature}
                  style="grid grid-cols-[6fr_1fr] col-span-7"
                />
              </div>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
}
