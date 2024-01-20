import React, { useState } from 'react';
import Expanditem from './Expanditem';

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

  function getASI(asi) {
    let bonuses = [];
    let statnames = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

    asi.forEach((val, i) => {
      if (val > 0) {
        bonuses.push('+' + val + ' to ' + statnames[i]);
      }
    });
    return bonuses;
  }

  return (
    <div className="grid gap-2 p-2 text-start">
      <p className="row-span-2 font-bold">Racial Features:</p>
      <div className="grid gap-2 pl-2">
        {props.race.features &&
          props.race.features.map((feat, i) => (
            <Expanditem feature={feat} key={i} />
          ))}
      </div>
      <p className="row-span-2 font-bold">Subrace Features:</p>
      <div className="grid gap-2 pl-2">
        {props.subrace.features &&
          props.subrace.features.map((feat, i) => (
            <Expanditem feature={feat} key={i} />
          ))}
      </div>
      <p className="row-span-2 font-bold">Class Features:</p>
      <div className="grid gap-2 pl-2">
        {props.pclass.features &&
          getLeveledFeatures(props.pclass.features, props.level).map(
            (feat, i) => <Expanditem feature={feat} key={i} />
          )}
      </div>
      <div className="grid gap-2 pl-2">
        {props.race.asi &&
          getASI(props.race.asi).map((x, i) => <p key={i}>{x}</p>)}
      </div>
      <p className="row-span-2 font-bold">Subclass Features:</p>
      <div className="grid gap-2 pl-2">
        {props.subclass.features &&
          getLeveledFeatures(
            props.subclass.features,
            props.level
          ).map((feat, i) => <Expanditem feature={feat} key={i} />)}
      </div>
      <p className="row-span-2 font-bold">Background Features:</p>
      <div className="grid gap-2 pl-2">
        {props.background.features &&
          props.background.features.map((feat, i) => (
            <Expanditem feature={feat} key={i} />
          ))}
      </div>
    </div>
  );
}
