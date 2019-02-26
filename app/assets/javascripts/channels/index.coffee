# app/assets/javascripts/channels/index.coffee
App.cable = ActionCable.createConsumer("/cable")
