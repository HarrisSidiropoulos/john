global.$ = global.jQuery = $ = require "jquery"

require "bootstrap/assets/javascripts/bootstrap/transition"
#require "bootstrap/assets/javascripts/bootstrap/affix"
#require "bootstrap/assets/javascripts/bootstrap/tab"
require "bootstrap/assets/javascripts/bootstrap/dropdown"
require "bootstrap/assets/javascripts/bootstrap/collapse"
require "bootstrap/assets/javascripts/bootstrap/tooltip"

require('./init-stapel.coffee')()
require('./menu.coffee')()
require('./form-carousel.coffee')()


$('.play-video-btn').bind('click', ()->
  $(this).toggleClass('playing');
  if ($(this).hasClass('playing'))
    $('video').attr('controls', 'true')
    $('video')[0].play()
  else
    $('video').removeAttr('controls')
    $('video')[0].pause()
  return false;
)
