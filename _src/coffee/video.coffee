module.exports = ()->
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
