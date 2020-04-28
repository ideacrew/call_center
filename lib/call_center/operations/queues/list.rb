# frozen_string_literal: true

module Operations
  module Queues

    # Provides summary information about the users for the specified Amazon Connect instance
    class List
      send(:include, Dry::Monads[:result, :do])

      # @param [String] instance_id
      # @param [String] next_token
      # @param [Integer] max_results
      # @return [Aws::Connect::Types::ListUsersResponse] response
      def call(params)
        values    = yield validate(params)
        response  = yield create(values)

        Success(response)
      end

      private

      def validate(params)
        result = CallCenter::Validation::Queues::QueueListContract.new.call(params)
        result.success? ? Success(result.to_h) : Failure(result)
      end

      def create(values)
        response = Aws::Connect::Client.list_queues(values)

        Success(response)
      end

    end
  end
end
