require 'json'

require 'yaml'

require 'nanite'
require 'nanite/mapper'

module Nanite
  class RackMapper

    HEADER = {
      'Content-Type' => 'text/plain'
    }.freeze

    BODY = "rack.input".freeze
    PATH = "REQUEST_PATH".freeze
    TYPE = "CONTENT_TYPE".freeze
    METHOD = "REQUEST_METHOD".freeze

    # Initialize the mapper, takes a set of options that get passed to the
    # mapper directly.
    def initialize(config_file)
      # Load the config file and pass it into the mapper
      @config = config_file ? YAML.load_file(config_file) : {}

      # Initialize the mapper when EventMachine has started
      EM.next_tick do
        Nanite.start_mapper(@config)
      end
    end

    # Call has a couple requirements for a proper message
    #   1. Content-Type must be application/json
    #   2. HTTP Method must be put
    #   3. Body must be well formatted JSON
    #   4. Body cannot be empty
    def call(env)
      # Check content-type
      if(env[TYPE] != 'application/json')
        raise 'content-type error'
      end

      # Check method
      if(env[METHOD].downcase != 'put')
        raise 'method error'
      end

      request = JSON.parse(env[BODY].read)

      options = request['options'] || {}
      payload = request['payload']

      # Default options (change to round-robin by default).
      options[:selector] ||= :rr

      # Convert the options to their symbol equivalents (pull from symbolize_keys in Rails)
      options.replace(
        options.inject({}) do |memo, (key, value)|
          memo[(key.to_sym rescue key) || key] = value
          memo
        end
      )

      success = Nanite.push(env[PATH], payload, options)

      [200, HEADER.dup, "#{success}"]
    rescue JSON::ParserError
      [400, HEADER.dup, 'invalid json']
    rescue => e
      [400, HEADER.dup, e.message]
    end
  end
end
