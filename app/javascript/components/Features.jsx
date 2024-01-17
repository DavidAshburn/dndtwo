import React, { useState } from "react";

export default function Features(props) {

  //class features only
  function getLeveledFeatures(features, level) {
    let levelfeats = [];
    let takendata = [];

    let namedex = 0;
    let names = [];
    let nameindexes = [];

    for (let [key, val] of Object.entries(features)) {
      //in all features
      if (parseInt(key) <= level) {
        //if the minimum level requirement is met
        for (let item of val) {
          if (item != 'Ability Score Increase:') {
            // skip ASI increases
            //check for duplicates among existing features
            let name = item.split(':')[0];
            let check = names.indexOf(name);
            if (check > -1) {
              levelfeats[check] = item; //replace duplicate features with their newer versions
            } else {
              levelfeats.push(item); //add features that have no duplicates to the end of the list
              names.push(name); //add the new names to the namelist
            }
            namedex++;
          }
        }
      }
    }
    return levelfeats;
  }

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
        getLeveledFeatures(props.pclass.features, props.level).map(
          (feat, i) => (
            <p key={i} className="text-start">
              {feat}
            </p>
          )
        )}
    </div>
  )
}