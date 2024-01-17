import React from 'react';

//props
//proficient(int) 0/1/2
//name(string)
//statmod(int) modifier from relevant statline
//profmod(int) overall proficiency modifier

export default function Profpane(props) {
  function getStatus(code) {
    if (parseInt(code) == 1) return 'P';
    if (parseInt(code) == 2) return 'E';
    return '';
  }

  let status = getStatus(props.proficient);
  let bonus =
    parseInt(props.statmod) +
    parseInt(props.profmod) * parseInt(props.proficient);

  return (
    <div className="grid grid-cols-[2rem_1fr_2rem] text-center items-center border border-green-600">
      <p>{bonus}</p>
      <p>{props.name}</p>
      <div className="rounded-full bg-green-300 flex justify-center items-center">
        <p>{status}</p>
      </div>
    </div>
  );
}
