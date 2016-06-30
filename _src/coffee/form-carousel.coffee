require "bootstrap/assets/javascripts/bootstrap/carousel"
require "select2"

validateEmail = (email) ->
  re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return re.test(email)

module.exports = ()->
  if ($('.participation-form .carousel').length>0)
    formCarousel = $('.participation-form .carousel')
    formCarousel.carousel({interval: 2000000})
    formCarousel.carousel('pause')

    formCarousel.find('.send').bind('click', (e)->
      errorMessage = "Παρακαλώ πληκτρολογήστε ένα όνομα"
      lastname = $('#lastname').val();
      isComing = $('#isComing').val();
      wishes = $('#wishes').val();
      if ((lastname == "" || lastname==errorMessage))
        $('#lastname').val(errorMessage)
        $('#lastname').select()
        $('#lastname').focus()
        return
      else
        formCarousel.carousel('next')
        $.ajax
          url: 'https://docs.google.com/forms/d/15iciiOBVvW8igv_2k1H4ZAh2QAci3FICg8qPu5HNrUU/formResponse'
          data:
            'entry.1382493389' : lastname
            'entry.705219583': isComing
            'entry.681694439': wishes
          type: 'POST'
          dataType: 'xml'
          statusCode:
            0: ->
              console.clear()
              $('#lastname').val ''
              $('#wishes').val ''
              $("#isComing").select2("val", "")
            200: ->
              $('#lastname').val ''
              $('#wishes').val ''
              $("#isComing").select2("val", "")

      e.preventDefault()
      return false
    )
    $(".select-age").select2();
