import React from 'react';
import { withComponentFeatures } from 'universal-dashboard';
import { TextLoop } from "react-text-loop-next";

const UDTextLoop = props => {
  return (
  <TextLoop
  key={props.id}
  children={props.children}
  interval={props.interval}
  delay={props.delay}
  adjustingSpeed={props.adjustingSpeed}
  fade={props.fade}
  mask={props.mask}
  springConfig={{stiffness: props.stiffness, damping: props.damping}}
  className={props.className}
/>
  );
}

export default withComponentFeatures(UDTextLoop)