import _ from 'lodash'
import * as p5Globals from 'p5/global'
import 'p5'


function setup() {
  createCanvas(windowWidth, windowHeight)
  background(255)
  
  strokeWeight(50)
  fill("yellow")
  stroke("black")
  circle(windowWidth/2.0, windowHeight/2.0, min(windowWidth, windowHeight) * 0.3)
}

function draw() {
}

(window as any).setup = setup; // for some reason semicolon is needed here
(window as any).draw = draw;
