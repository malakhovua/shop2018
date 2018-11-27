App.carts = App.cable.subscriptions.create "CartsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".carts_cable").html(data)




