require "./jquery.stapel"

module.exports = ()->
  $grid = $('#tp-grid')
  $name = $('#name')
  $close = $('#close')
  $loader = $('<div class="loader"><i></i><i></i><i></i><i></i><i></i><i></i><span>Loading...</span></div>').insertBefore($grid)
  stapel = $grid.stapel(
    onLoad: ->
      $loader.remove()
      return
    onBeforeOpen: (pileName) ->
      $name.html pileName
      return
    onAfterOpen: (pileName) ->
      $close.show()
      return
  )
  $close.on 'click', ->
    $close.hide()
    $name.empty()
    stapel.closePile()
    return
  return
