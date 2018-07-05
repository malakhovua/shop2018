class WSQueue
  include Singleton

   def initialize
     @connection = Bunny.new
     @connection.start
     @channel= @connection.create_channel
     @queue = @channel.queue('broadcast',)
     @x  = @channel.default_exchange
   end

  def publish_comment(text)
    @x.publish(text, :routing_key => @queue.name)
  end

=begin
  def self.publish(action, object)
    message = {
        action: action,
        data: object
    }.to_json
    @x.publish(message, :routing_key => @queue.name)
  end
=end

end
