# frozen_string_literal: true

module CallCenter
  module Operations
    module Queues

      # Provides summary information about the queues for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @return [Aws::Connect::Types::ListUsersResponse] response
        def call(params)
          values    = yield validate(params)
          response  = yield list(values)
          queues    = yield serialize(response)

          Success(queues)
        end

        private

        def validate(params)
          values = CallCenter::Validation::Queues::ListContract.new.call(params)
          values.success? ? Success(values) : Failure(values)
        end

        def list(values)
          response = Try { AwsConnection.list_queues(values.to_h) }
          response.to_result
        end

        def serialize(response)
          queues = response.queue_summary_list.reduce([]) { |list, queue| list << queue; list }

          Success(queues)
        end

      end
    end
  end
end
