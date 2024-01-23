import React from 'react';



export default function Profpane({name, index, profmod, statmod, bprof, rprof, cprof, bgprof}) {
  function getCodeLetter(code) {
    if (parseInt(code) == 1) return 'P';
    if (parseInt(code) == 2) return 'E';
    return '-';
  }

  function calcProficiency() {
    let output = 0;
    let checkarray = [bprof[index], rprof[index], cprof[index], bgprof[index],]
  
    for(let item of checkarray) {
      if(item > output) output = item;
    }
    return output;
  }

  let proficiencybonus = calcProficiency();
  let bonus =
    parseInt(statmod) +
    parseInt(profmod) * proficiencybonus;

  return (
    <div className="grid grid-cols-[2rem_1fr_2rem] text-center items-center border border-green-600">
      <p>{bonus}</p>
      <p>{name}</p>
      <div className="flex items-center justify-center bg-green-300 rounded-full">
        <p>{getCodeLetter(proficiencybonus)}</p>
      </div>
    </div>
  );
}
