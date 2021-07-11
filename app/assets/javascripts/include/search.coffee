$(document).on 'turbolinks:load', ->
  products = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      wildcard: '%QUERY'
      url: '/search?query=%QUERY')

  products.initialize()

  $('#typeahead').typeahead { highlight: true },
    name: 'products'
    display: 'title'
    limit: 10
    source: products

  $('#typeahead').bind 'typeahead:select', (ev, suggestion) ->
    window.location = '/product/' + encodeURIComponent(suggestion.id)
    return
  return
