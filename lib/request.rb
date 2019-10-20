class Request
  attr_accessor :verb, :path, :headers, :data

  def initialize(session)
    metadata = []
    while (request = session.gets) && !request.chomp.empty?
      metadata << request.chomp
    end

    build_resource(metadata.shift)
    build_headers(metadata)
    read_data(session)
  end

  def to_s
    "-> #{@verb} #{@path}"
  end

  private

  def read_data(session)
    data_length = headers['Content-Length'].to_i
    @data = session.read(data_length) if data_length.positive?
  end

  def build_headers(lines)
    headers = lines.map { |line| line.split(': ') }
    @headers = headers.to_h
  end

  def build_resource(line)
    @verb, @path, = line.split(' ')
  end
end
