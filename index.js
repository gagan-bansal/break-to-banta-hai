const actions = [
	'Move eyes left and right.',
	'Move eyes up and down.',
	'Move eyes diagonally',
	'Rotate your eyes',
	'Blink your eyes',
	'Close tightly your eyes',
  'Palm your eyes',
  'Focus on moving pencil',
	'Look far through window'
];
const cfonts = require('cfonts');
const action = actions[Math.floor(Math.random() * actions.length)];

cfonts.say(action, {
	font: 'block',              // define the font face
	align: 'left',              // define text alignment
	colors: ['system'],         // define all colors
	background: 'transparent',  // define the background color, you can also use `backgroundColor` here as key
	letterSpacing: 1,           // define letter spacing
	lineHeight: 1,              // define the line height
	space: true,                // define if the output text should have empty lines on top and on the bottom
	maxLength: '0',             // define how many character can be on one line
	gradient: false,            // define your two gradient colors
	independentGradient: false, // define if you want to recalculate the gradient for each new line
	transitionGradient: false,  // define if this is a transition between colors directly
	env: 'node'                 // define the environment cfonts is being executed in
})
