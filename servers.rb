# Instructions:
# Run this file in one terminal as a normal ruby file - ruby servers.rb
# This opens up the local server.
# In a second terminal access the server with 'telnet localhost 2345'

require 'socket'

server = TCPServer.new(2345)

# Keep the server open so that a user can keep reconnecting.
# Without loop it will close and not be reaccessible until you re-run the ruby script.

loop do

  socket = server.accept

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  socket.puts "You said: #{they_said}. Goodbye!"

  # Add a loop that listens for the word quit. Otherwise it keeps replying.
  # Once quit is entered it closes the client connection to the server.

  while socket.gets.chomp != 'quit'

    socket.puts "Keep talking to me..."

  end

  socket.close

end
