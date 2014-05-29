$(document).ready(initialize)

var timer;

function initialize(){
  background();
  // start();
}

function start(){
  clearInterval(timer);
  timer = setInterval(background, 6000);
}

function background(){
  var n = Math.floor(Math.random() * 27);
  var url = '/assets/' + n + '.gif';
  console.log(url);
  $('body').css('background-image', 'url(' + url + ')');
  $('body').css('background-size', '100%, 100%');
}
