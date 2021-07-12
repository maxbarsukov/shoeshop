$(document).on("turbolinks:load", function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function showCart(cart) {
        if($.trim(cart) == '<td>Cart is Empty</td>') {
            $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'none');
        } else {
            $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'inline-block');
        }
        $('#cart .modal-body').html(cart);
        $('#cart').modal();
        if ($('.cart-sum').text()) {
            $('.simpleCart_total').html($('.cart-sum').text());
        } else {
            $('.cart-sum').text('Empty Cart');
        }
    }

    function getCart() {
        $.ajax({
            url: '/cart',
            type: 'GET',
            success: function(res) {
                showCart(res);
            },
            error: function(err) {
                console.log('Can\'t get cart:');
                console.log(err);
            }
        });
    }

    function showCartEmpty() {
        var result = { error: 'Please Sign In to view the Cart' };
        var modal = $('#cart').modal();
        $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'none');
        modal.find('.modal-body').html(result.error);
    }

    function clearCart() {
        $.ajax({
            url: '/cart/',
            method: 'delete',
            type: 'POST',
            success: function(res) {
                showCart(res);
            },
            error: function(err) {
                console.log('Can\'t clear cart:');
                console.log(err);
            }
        });
    }

    $('body').on('click', '.add-to-cart-link', function(e) {
        e.preventDefault();
        var product_id  = $(this).data('id'),
            quantity    = $('.quantity input').val() ? $('.quantity input').val() : 1,
            mod         = $('.available select').val(),
            access      = $('#cart_access').val();

        if (access == 99) {
            showCartEmpty();
            return false;
        }

        $.ajax({
            beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token',
                $('meta[name="csrf-token"]').attr('content'))},
            url: '/cart/items',
            data: {product_id: product_id, quantity: quantity, mod: mod},
            type: 'POST',
            success: function(res) {
                showCart(res);
            },
            error: function(err) {
                console.log('Can\'t show cart:');
                console.log(err);
            }
        });
    });

    $('#cart .modal-body').on('click', '.del-item', function() {
        var id  = $(this).data('id')

        $.ajax({
            beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token',
                $('meta[name="csrf-token"]').attr('content'))},
            url: '/cart/items/' + id,
            data: { id: id },
            method: 'delete',
            type: 'POST',
            success: function(res) {
                showCart(res);
            },
            error: function(err) {
                console.log('Can\'t delete item:');
                console.log(err);
            }
        });
    });
});
