$(document).on('turbolinks:load',function() {
    // console.log($('#new_comment'));
    $('button.test').click(function() {

        var old_res = parseInt($('span.click-result').text());

        $('span.click-result').text(old_res + 1);
    });

});

$(document).on('turbolinks:load',function() {
    $('form#new_comment').on('ajax:success', function(event, response, status) {

        var $form = $(event.currentTarget);
        console.log(response);
        $('.comment-errors').html('');
        if (response.errors) {
            for (var field in response.errors) {
                var $el = $('<li></li>');
                var msg = field + ': ';

                for(var i = 0; response.errors[field].length > i; ++i) {
                    msg += response.errors[field][i] + '; ';
                }
                $el.text(msg);
                $el.appendTo('.comment-errors');
            }
        } else {
            var $el = $('<li></li>');
            $el.text(response.nick + ' : ' + response.text);
            $el.appendTo('#comments-list');
            $form.find('[name="comment[text]"]').val('');
        }
    })
});