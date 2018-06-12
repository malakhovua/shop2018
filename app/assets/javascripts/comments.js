
$(function () {
    $('button.test').click(function() {
       console.log('CLICK')

    var old_res =parseInt($('span.click-result').text());
    $('span.click-result').text(++ old_res);
    });
});

/*
$(function () {
    $('form#new_comment').submit(function (event){
        console.log('SUBMIT111')

        var $form = $(event.currentTarget);
        console.log($form.attr('action'));
        console.log($form.attr('method'));

        var url = $form.attr('action');
        var method = $form.attr('method');
        $.ajax(url,{
            method: method,
            success: function (response) {
            console.log(response);

            if (response.errors){

              for (var field in response.errors){
                    var $el = $('<li></li>');
                    var msg = field + ':';

                    for (var i = 0; response.errors[field].length > i, i++){
                        msg += response.errors[field][i] + '; ';
                    }
                    $el.text(msg);
                    $el.appendTo('.comments-errors');
                }
            } else {
                var $el = $('<li></li>');
                $el.text(response.nick + ' : ' + response.text);
                $el.appendTo('#comments-list');
                text: $form.find('textarea[name="comment[text]"]').val('')
            }
                $('.comment-errors').html('');
            },
            data: { comment: {
                nick: $form.find('input[name="comment[nick]"]').val(),
                text: $form.find('textarea[name="comment[text]"]').val()
                }

            }
        });

        return false;
    });
});*/
