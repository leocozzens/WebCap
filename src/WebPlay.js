const player = document.createElement('script');
player.src = '../dist/WebPlay.player.js';
document.head.appendChild(player);

// Get necessary DOM elements
const startButton = document.getElementById('startButton');
const stopButton = document.getElementById('stopButton');
const downloadLink = document.getElementById('downloadLink');
const videoElement = document.getElementById('videoElement');
