module.exports = ()->
  if $(window).height()<=768
    $('#home').height($(window).height())
    window.addEventListener("orientationchange", ()->
      setTimeout(()->
        $('#home').height($(window).height())
      , 128)
    )  
