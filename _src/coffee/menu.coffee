global.$ = global.jQuery = $ = require "jquery"
require "jquery.scrollto"
$.extend($.scrollTo.defaults, {
  axis: 'y',
  duration: 500,
  interrupt: true
});

module.exports = ()->
  scroll = (item)->
    target = item.attr('href')
    $(global).scrollTo($(target), 800, {offset: -50})
    return false;

  $('.navbar-brand').bind('click', ()->
    scroll($(this))
  )
  $('.navbar .navbar-nav a').each(()->
    $(this).bind('click', ()->
      scroll($(this))
    )
  )
