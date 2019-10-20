require 'socket'

require_relative 'lib/request'
require_relative 'lib/response'
require_relative 'lib/resolver'

host = ENV['BIND_ADDRESS'] || 'localhost'
port = ENV['PORT'] ? ENV['PORT'].to_i : 8080

server = TCPServer.new(host, port)
warn "🚀 Server running at #{host}:#{port}"

loop do
  session = server.accept
  req = Request.new(session)

  data = 'NOT FOUND'
  headers = { 'server' => 'RUBY Server' }
  status = 404

  res = Response.new(response: data, status: status,
                     headers: headers)

  session.print(res.render)
  session.close
end
