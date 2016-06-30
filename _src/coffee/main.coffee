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
    $(this).find('video').attr('controls', 'true')
    $(this).find('video')[0].play()
  else
    $(this).find('video').removeAttr('controls')
    $(this).find('video')[0].pause()
  return false;
)

$('.play-video-btn video').on('ended',() ->
  $(this).parent().removeClass('playing')
  $(this).removeAttr('controls')
);

if $(window).height()<=768
  $('#home').height($(window).height())
  window.addEventListener("orientationchange", ()->
    setTimeout(()->
      $('#home').height($(window).height())
    , 128)
  )
