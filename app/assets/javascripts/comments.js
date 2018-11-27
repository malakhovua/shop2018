
$(function() {
    // window.WsClient = new WebSocket('ws://localhost:8080');

    window.PusherClient = new Pusher('bcb9abfbbdd2ef7e3a51', {
        cluster: 'eu',
        encrypted: true
    });

    var channel = PusherClient.subscribe('broadcast');
    channel.bind('comments.new', function(comment) {
        var $comments_list =  $('#comments-list');
        var current_user_id = $comments_list.data('current_user_id');
        var product_id = $comments_list.data('product_id');

        if ($comments_list.length) {
            if (product_id !== comment.product_id) {
                return;
            }

            var $el = $('<li data-comment_id="' + comment.id + '"></li>');
            $el.text(comment.nick + ' : ' + comment.text);
            if (current_user_id === comment.user_id) {
                var rm_link = $('<a class="btn btn-default" data-remote="true" rel="nofollow" data-method="delete" href="/products/' + product_id + '/comments/' + comment.id + '">Remove</a>');

                $el.append(rm_link);
            }

            $el.appendTo('#comments-list');
        }
    });
    channel.bind('comments.destroy', function(comment) {
        var $comments_list =  $('#comments-list');
        var current_user_id = $comments_list.data('current_user_id');
        var product_id = $comments_list.data('product_id');

        if ($comments_list.length) {

            if (product_id !== comment.product_id) {
                return;
            }

            //
            // 'li[id=comment]'
            // 'li#comment'
            // 'li[class=comments]'
            // 'li.comments'
            // 'li[data-comment_id="'+ response_data.data.id +'"]'

            $comments_list.find('li[data-comment_id="'+ comment.id +'"]').remove();
        }
    });
});

$(document).on('turbolinks:load', function() {
    // console.log($('#new_comment'));
    $('button.test').click(function() {

        var old_res = parseInt($('span.click-result').text());

        $('span.click-result').text(old_res + 1);
    });

});

$(document).on('turbolinks:load', function() {
    // WsClient.onmessage = function(response) {
    //   var response_data = JSON.parse(response.data);
    //
    //   var $comments_list =  $('#comments-list');
    //   var current_user_id = $comments_list.data('current_user_id');
    //   var product_id = $comments_list.data('product_id');
    //
    //   if ((response_data.action === 'comments.new') && $comments_list.length) {
    //     if (product_id !== response_data.data.product_id) {
    //       return;
    //     }
    //
    //     var $el = $('<li data-comment_id="' + response_data.data.id + '"></li>');
    //     $el.text(response_data.data.nick + ' : ' + response_data.data.text);
    //     if (current_user_id === response_data.data.user_id) {
    //       var rm_link = $('<a class="btn btn-default" data-remote="true" rel="nofollow" data-method="delete" href="/products/' + product_id + '/comments/' + response_data.data.id + '">Remove</a>');
    //
    //       $el.append(rm_link);
    //     }
    //
    //     $el.appendTo('#comments-list');
    //   } else if ((response_data.action === 'comments.destroy') && $comments_list.length) {
    //
    //     if (product_id !== response_data.data.product_id) {
    //       return;
    //     }
    //
    //     //
    //     // 'li[id=comment]'
    //     // 'li#comment'
    //     // 'li[class=comments]'
    //     // 'li.comments'
    //     // 'li[data-comment_id="'+ response_data.data.id +'"]'
    //
    //     $comments_list.find('li[data-comment_id="'+ response_data.data.id +'"]').remove();
    //   }
    // };

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
            // var $el = $('<li></li>');
            // $el.text(response.nick + ' : ' + response.text);
            // $el.appendTo('#comments-list');
            $form.find('[name="comment[text]"]').val('');
        }
    })
});


// $(function() {
//   $('form#new_comment').submit(function(event) {
//     console.log('SUBMIT!');
//
//     var $form = $(event.currentTarget);
//     console.log($form.attr('action'));
//     console.log($form.attr('method'));
//
//     var url = $form.attr('action');
//     var method = $form.attr('method');
//     $.ajax(url, {
//       method: method,
//       success: function(response) {
//         console.log(response);
//         $('.comment-errors').html('');
//         if (response.errors) {
//           for (var field in response.errors) {
//             var $el = $('<li></li>');
//             var msg = field + ': ';
//
//             for(var i = 0; response.errors[field].length > i; ++i) {
//               msg += response.errors[field][i] + '; ';
//             }
//             $el.text(msg);
//             $el.appendTo('.comment-errors');
//           }
//         } else {
//           var $el = $('<li></li>');
//           $el.text(response.nick + ' : ' + response.text);
//           $el.appendTo('#comments-list');
//           $form.find('[name="comment[text]"]').val('');
//         }
//       },
//       data: { comment: {
//         nick: $form.find('[name="comment[nick]"]').val(),
//         text: $form.find('[name="comment[text]"]').val()
//       } }
//     });
//     return false;
//   });
// })