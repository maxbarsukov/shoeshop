$(document).on 'turbolinks:load', ->
  $.ajaxSetup
    headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    beforeSend: (xhr) ->
      xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
      return

  window.showCart = (cart) ->
    if $.trim(cart) == '<td>Cart is Empty</td>'
      $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css 'display', 'none'
    else
      $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css 'display', 'inline-block'
    $('#cart .modal-body').html cart
    $('#cart').modal()
    if $('.cart-sum').text()
      $('.simpleCart_total').html $('.cart-sum').text()
    else
      $('.cart-sum').text 'Empty Cart'
    return

  window.getCart = ->
    $.ajax
      url: '/cart'
      type: 'GET'
      success: (res) ->
        showCart res
        return
      error: (err) ->
        console.log 'Can\'t get cart:'
        console.log err
        return
    return

  window.showCartEmpty = ->
    result = error: 'Please Sign In to view the Cart'
    modal = $('#cart').modal()
    $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css 'display', 'none'
    modal.find('.modal-body').html result.error
    return

  window.clearCart = ->
    $.ajax
      url: '/cart/'
      method: 'delete'
      type: 'POST'
      success: (res) ->
        showCart res
        return
      error: (err) ->
        console.log 'Can\'t clear cart:'
        console.log err
        return
    return

  $('body').on 'click', '.add-to-cart-link', (e) ->
    e.preventDefault()
    product_id = $(this).data('id')
    quantity = if $('.quantity input').val() then +$('.quantity input').val() else 1
    mod = $('.available select').val()
    access = +$('#cart_access').val()
    if access == 99
      showCartEmpty()
      return false
    $.ajax
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      url: '/cart/items'
      data:
        product_id: product_id
        quantity: quantity
        mod: mod
      type: 'POST'
      success: (res) ->
        showCart res
        return
      error: (err) ->
        console.log 'Can\'t show cart:'
        console.log err
        return
    return
  $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css 'display: none;'
  $('#cart .modal-body').on 'click', '.del-item', ->
    id = $(this).data('id')
    $.ajax
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      url: '/cart/items/' + id
      data: id: id
      method: 'delete'
      type: 'POST'
      success: (res) ->
        showCart res
        return
      error: (err) ->
        console.log 'Can\'t delete item:'
        console.log err
        return
    return
  return
