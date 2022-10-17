var art = require('ascii-art');
var actions = [
	'Move eyes left and right.',
	'Move eyes up and down.',
	'Move eyes diagonally',
	'Rotate your eyes',
	'Blink your eyes',
	'Close tightly your eyes',
  'Palm your eyes',
  'Focus on moving pencil',
	'Look far through window']
art.font(actions[Math.floor(Math.random()*9)],
	'Doom', 'cyan', function(t) {console.log(t)});
