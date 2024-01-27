import React, { useState } from 'react';
import Expanditem from './Expanditem';

export default function Features({
  race,
  subrace,
  pclass,
  subclass,
  background,
  classleveledchoices,
  level,
}) {
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
        {race.features &&
          race.features.map((feat, i) => (
            <Expanditem
              feature={feat}
              style="grid grid-cols-[6fr_1fr]"
              key={i}
            />
          ))}
      </div>
      <p className="row-span-2 font-bold">Subrace Features:</p>
      <div className="grid gap-2 pl-2">
        {subrace.features &&
          subrace.features.map((feat, i) => (
            <Expanditem
              feature={feat}
              style="grid grid-cols-[6fr_1fr]"
              key={i}
            />
          ))}
      </div>
      <p className="row-span-2 font-bold">Class Features:</p>
      <div className="grid gap-2 pl-2">
        {pclass.features &&
          getLeveledFeatures(pclass.features, level).map(
            (feat, i) => (
              <Expanditem
                feature={feat}
                style="grid grid-cols-[6fr_1fr]"
                key={i}
              />
            )
          )}
        {classleveledchoices &&
          classleveledchoices.map((feat, i) => (
            <Expanditem
              feature={feat}
              style="grid grid-cols-[6fr_1fr]"
              key={i}
            />
          ))}
      </div>
      <div className="grid gap-2 pl-2">
        {race.asi &&
          getASI(race.asi).map((x, i) => <p key={i}>{x}</p>)}
      </div>
      <p className="row-span-2 font-bold">Subclass Features:</p>
      <div className="grid gap-2 pl-2">
        {subclass.features &&
          getLeveledFeatures(subclass.features, level).map(
            (feat, i) => (
              <Expanditem
                feature={feat}
                style="grid grid-cols-[6fr_1fr]"
                key={i}
              />
            )
          )}
      </div>
      <p className="row-span-2 font-bold">Background Features:</p>
      <div className="grid gap-2 pl-2">
        {background.features &&
          background.features.map((feat, i) => (
            <Expanditem
              feature={feat}
              style="grid grid-cols-[6fr_1fr]"
              key={i}
            />
          ))}
      </div>
    </div>
  );
}
