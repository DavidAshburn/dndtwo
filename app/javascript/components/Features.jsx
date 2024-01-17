import React, { useState } from "react";

export default function Features(props) {

  return (
    <div className="grid gap-2 p-2">
      <p className="row-span-2 font-bold">Racial Features:</p>
      {props.race.features &&
        props.race.features.map((feat, i) => (
          <p key={i} className="text-start">
            {feat}
          </p>
        ))}
      <p className="row-span-2 font-bold">Class Features:</p>
      {props.pclass.features &&
        props.callback(props.pclass.features, props.level).map(
          (feat, i) => (
            <p key={i} className="text-start">
              {feat}
            </p>
          )
        )}
    </div>
  )
}