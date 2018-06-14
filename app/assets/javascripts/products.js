
$(function () {
  console.log('DOCUMENT READY!')
});
$(document).on('turbolinks:load',function () {
    console.log('turbolinks load!')
})




$(document).on('turbolinks:load',function() {
    // class
    $('.class-name');
    $('[class="class-name"]')

    // $('a[data-method="delete"]').click()


    // id
    $('#id-name');
    $('[id="id-name"]')

    $('[attr_name="attr_val"]')

    $('a.delete-product').click(function(event) {
        // event.preventDefault();
        // event.stopPropagation();
        console.log($(event.currentTarget).attr('href'));

        $(event.currentTarget).attr('href');

        $.ajax($(event.currentTarget).attr('href'), {
            method: 'DELETE',
            success: function() {
                window.location.href = window.location.href;
            }
        });


        return false;
    });
});














/*
$(function(){
   $('a.delete-product').click(function (event) {
       /!*event.preventDefault();
       event.stopPropagation();*!/
       console.log($(event.currentTarget).attr('href'));
       $.ajax($(event.currentTarget).attr('href'),{
          method: 'DELETE',
           success: function () {
              window.location.href = window.location.href;
           }
       });

       return false;
 });
});
*/
// console.log(value);
