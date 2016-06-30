global.$ = global.jQuery = $ = require "jquery"
require "jquery.scrollto"
$.extend($.scrollTo.defaults, {
  axis: 'y',
  duration: 500,
  interrupt: true
});
offset = 50;
module.exports = ()->
  scroll = (item)->
    target = item.attr('href')
    $(global).scrollTo($(target), 500, {offset: -offset})
    return false;

  $('.navbar-brand').bind('click', ()->
    scroll($(this))
  )
  $('#home .section-image-more-btn').bind('click', ()->
    $(global).scrollTo($(window).height()-offset, 500)
  )
  $('.navbar .navbar-nav a').each(()->
    $(this).bind('click', ()->
      if $(window).width() < 767
        $('.navbar-collapse').collapse('hide')
      scroll($(this))
    )
  )
