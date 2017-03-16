$(document).ready(function(){
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


});