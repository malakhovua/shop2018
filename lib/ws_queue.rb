class WsQueue
  include Singleton

  def initialize
    @connection = Bunny.new
    @connection.start
    @channel = @connection.create_channel
    @queue = @channel.queue('broadcast', :auto_delete => true)
    @x  = @channel.default_exchange
  end

  def publish(action, object)
    message = {
        action: action,
        data: object
    }.to_json
    @x.publish(message, :routing_key => @queue.name)
  end

  class << self
    def publish(action, object)
      instance.publish(action, object)
    end
  end

end

