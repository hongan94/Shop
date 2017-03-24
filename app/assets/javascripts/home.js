$(document).on('turbolinks:load', function(){
    $(".login").click(function(){
        $('.submit_login').trigger('click')
    });
    $(".signup").click(function(){
       $('.submit_signup').trigger('click')
    });
    $('.modal-footer .btn-default').hover(function(e){
        $(this).toggleClass('hover');
    });
    $('.menu-left li a.list-group-item').hover(function(e){
        $(this).toggleClass('hover');
    });

    $('.remove_cart').click(function(){
        item_id = $(this).data('id');
        var info = { item_id: item_id };
        $.ajax ({
            method: 'delete',
            url: '/carts',
            data: info,
            dataType: 'script',
        });
    });

    $('.remove_all').click(function(){
        delete_all = $(this).data("delete-all");
        var info = { delete_all: delete_all }
        $.ajax ({
           method: 'delete',
            url: '/carts',
            data: info,
            dataType: 'script'
        });
    })
});