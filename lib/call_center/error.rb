# frozen_string_literal: true

module CallCenter
  module Error
    # @api private
    module ErrorInitalizer
      attr_reader :original

      def initialize(msg, original = $!)
        super(msg)
        @original = original
      end
    end

    # @api public
    class Error < StandardError
      include ErrorInitalizer
    end

    class LoadException < LoadError
      include ErrorInitalizer
    end
    
    CreateUserError = Class.new(Error)
    CreateClientError = Class.new(Error)
  end
end
