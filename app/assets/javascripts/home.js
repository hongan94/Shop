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

    $(document).on('click', '.remove_cart', function(){
        item_id = $(this).data('id');
        var info = { item_id: item_id };

        $.ajax ({
            method: 'delete',
            url: '/carts',
            data: info,
            dataType: 'script',
            success:function(res){
                $('#modal_show_cart').load(location.href + " #modal_show_cart>*","");
                $('.navbar-right').load(location.href + " .navbar-right>*","");
            }
        });
    });

    $('.remove_all').click(function(){
        delete_all = $(this).data("delete-all");
        var info = { delete_all: delete_all };
        $.ajax ({
           method: 'delete',
            url: '/carts',
            data: info,
            dataType: 'script'
        });
    });

});