require 'date'

class Response
  attr_accessor :status, :headers 
  attr_reader :response

  DEFAULT_HEADERS = {
    "Content-Type": 'text/plain',
    "Connection": 'close'
  }.freeze

  def initialize(status: 200, headers: {}, response: '')
    @status = status
    @headers = DEFAULT_HEADERS.merge(headers)
    @headers['Content-Length'] = response.bytesize
    @headers['Date'] = DateTime.now.new_offset(0).strftime('%a %e %b %Y %k:%M:%S GMT')
    @response = response
  end

  def render
    data = ["HTTP/1.1 #{status} OK"]
    data = (data + headers.map { |header, value| "#{header}: #{value}" }).uniq
    data.push('')
    data.push(response)

    data.join("\r\n")
  end

  def response=(res)
    @response = res
    @headers['Content-Length'] = res.bytesize
  end


end
