# frozen_string_literal: true

module CallCenter
  module Queues

    # Schema and validation rules for the {CallCenter::Operations::Queues::List} operation
    class QueueListContract < CallCenter::Validation::ApplicationContract

      # @!method call(opts)
      # @param [Hash] opts the parameters to validate using this contract
      # @option opts [String] :instance_id (required)
      # @option opts [String] :next_token
      # @option opts [Integer] :max_results
      # @return [Dry::Monads::Result::Success] if params pass validation
      # @return [Dry::Monads::Result::Failure] if params fail validation
      params do
        required(:instance_id).value(:string)
        optional(:queue_types).value(CallCenter::Types::QueueKinds)
        optional(:next_token).value(:string)
        optional(:max_results).value(:integer)
      end

    end
  end
end
