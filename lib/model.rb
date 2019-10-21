# frozen_string_literal: true

require_relative './database'

class Model
  attr_accessor :collection, :document

  def save
    DB_CLIENT[@collection].insert_one(@document)
  end

  def method_missing(method, *args, _block)
    return @document[method] if @document.key?(method)

    @document[:"#{method.to_s.gsub(/=/, "")}"] = args.shift unless args.empty?
  end

  def respond_to_missing?(method, include_private = true)
    @document.key?(method) || super
  end

end
