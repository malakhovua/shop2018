class CartsChannel < ApplicationCable::Channel
  def subscribed
     stream_from "carts"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
