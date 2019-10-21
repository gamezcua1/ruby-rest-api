# frozen frozen_string_liteals: true

require 'mongo'
require 'yaml'

MONGO_URI =
  begin
    YAML.load_file(Dir.pwd + '/lib/config.yml')["mongo_URI"]
  rescue Errno::ENOENT, KeyError
    '.'
  end


puts MONGO_URI

DB_CLIENT = Mongo::Client.new(MONGO_URI)
