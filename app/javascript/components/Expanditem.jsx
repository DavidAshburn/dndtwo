import React, { useState } from 'react';

export default function Expanditem({ feature, style }) {
  let [hidden, setHidden] = useState(true);

  function toggleText() {
    setHidden(!hidden);
  }

  let split = feature.split(': ');

  return (
    <div className={style} id="expanditem">
      <p className="font-semibold" id="expanditemtitle">
        {split[0]}{' '}
      </p>
      <button
        className="h-6 w-6 rounded-full flex items-center text-center bg-gray-100"
        onClick={toggleText}
      >
        +
      </button>
      <p className="col-span-2" hidden={hidden} id="expanditembody">
        {split[1]}
      </p>
    </div>
  );
}
