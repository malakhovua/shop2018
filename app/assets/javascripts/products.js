
$(document).on('turbolinks:load',function() {
    $('a.remove-image').click(function (event) {
        var $target = $(event.currentTarget);
        var $block = $target.closest('.nested-fields');
        $block.find('._destroy');
        $block.find('._destroy').val('1');
        $block.hide();
        return false;
    })
});


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

    $('.add-more-image').click(function(event) {
        $('.nested-fields')
        var $block = $('<div class="nested-fields"></div>');
        var $res = $block.append($($('.nested-fields')[0]).html());

        _.each($res.find('input'), function(elem) {
            var $elem = $(elem);
            var old_name = $elem.attr('name');
            var new_name = old_name.split('][');
            new_name[1] = Date.now();
            new_name = new_name.join('][');

            $elem.attr('name', new_name);
        });

        $res.find('img').remove();

        $( $res ).insertAfter( $('.nested-fields')[0] );

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
