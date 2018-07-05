require 'em-websocket'
require 'bunny'
require 'json'

ws_connections = []

conn = Bunny.new
conn.start
ch  = conn.create_channel
q  = ch.queue('broadcast', :auto_delete => true)

q.subscribe do |delivery_info, metadata, payload|
  puts payload
  ws_connections.each do |ws|
   ws.send(payload)
    end
end

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen { |handshake|
      ws_connections << ws

    }

    ws.onclose {
      ws_connections.delete(ws)
    }

=begin
    ws.onmessage {

    }
=end
  end
}