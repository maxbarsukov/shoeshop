$(document).on 'turbolinks:load', ->
  $('#slider4').responsiveSlides
    auto: true
    pager: true
    nav: true
    speed: 500
    namespace: 'callbacks'
    before: ->
      $('.events').append '<li>before event fired.</li>'
      return
    after: ->
      $('.events').append '<li>after event fired.</li>'
      return
  return
