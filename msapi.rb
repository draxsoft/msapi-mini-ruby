require 'socket'

script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()'
header = "\0" * 16
header[8, 4] = [(script.length + 1).to_i].pack('L<')

begin
  socket = TCPSocket.new('127.0.0.1', 5553)
  socket.write(header + script + "\0")
  socket.close
  puts 'F12 in Roblox to see script activity.'
rescue StandardError => e
  puts "Error: #{e.message}"
end
