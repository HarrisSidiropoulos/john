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
    formCarousel.find('.next').bind('click', (e)->
      name = $('#name').val();
      email = $('#email').val();
      nameErrorMessage = "Παρακαλώ πληκτρολογήστε ένα όνομα"
      emailErrorMessage = "Παρακαλώ πληκτρολογήστε ένα email"
      if ((name != "") && (email != "" && (validateEmail(email))))
        formCarousel.carousel('next')
      else if (name == "" || name == nameErrorMessage)
        $('#name').val(nameErrorMessage);
        $('#name').select()
        $('#name').focus()
      else if (email == "" || email == emailErrorMessage)
        $('#email').val(emailErrorMessage);
        $('#email').select()
        $('#email').focus()
      else if (email != "" && (!validateEmail(email)))
        $('#email').val("Παρακαλώ πληκτρολογήστε ένα σωστό email");
        $('#email').select()
        $('#email').focus()

      e.preventDefault()
      return false
    )

    formCarousel.find('.send').bind('click', (e)->
      formCarousel.carousel('next')
      name = $('#name').val();
      email = $('#email').val();

      age       = $('#age').select2('data');
      computers = $('#computers').select2('data');
      languages = $('#languages').select2('data');
      interests = $('#interests').select2('data');

      age       = if age? then age.text else ''
      computers = if computers? then computers.text else ''

      _languages = []
      _languages.push(language.text) for language in languages when languages isnt null

      _interests = []
      _interests.push(interest.text) for interest in interests when interests isnt null

      if ((name != "") && (email != "" && (validateEmail(email))))
        $.ajax
#          url: 'https://docs.google.com/forms/d/1U2ou6zfzhfqlikpqlbRXmzvIh-V83L__MDXfsARM8Fw/formResponse'
          data:
            'entry_780057511' : name
            'entry_1313484138': email
            'entry_1754681902': age
            'entry_838361545' : computers
            'entry_934719052' : _languages.join(', ')
            'entry_1425268914': _interests.join(', ')
          type: 'POST'
          dataType: 'xml'
          statusCode:
            0: ->
              console.clear()
              $('#name').val ''
              $('#email').val ''
              $("#age").select2("val", "")
              $("#computers").select2("val", "")
              $("#languages").select2("val", "")
              $("#interests").select2("val", "")
            200: ->
              $('#name').val ''
              $('#email').val ''
              $("#age").select2("val", "")
              $("#computers").select2("val", "")
              $("#languages").select2("val", "")
              $("#interests").select2("val", "")

      e.preventDefault()
      return false
    )
    $(".select-age").select2();
