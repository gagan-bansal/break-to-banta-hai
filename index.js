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

const action = actions[Math.floor(Math.random() * actions.length)];
process.stdout.write(action);
