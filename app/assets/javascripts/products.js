$(function(){
   $('a.delete-product').click(function (event) {
       /*event.preventDefault();
       event.stopPropagation();*/
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
