# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Provides summary information about the {User} for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @return [Aws::Connect::Types::ListUsersResponse] response
        def call(instance_id:)
          response  = yield list(instance_id)
          users     = yield serialize(response)

          Success(users)
        end

        private

        def list(instance_id)
          response = Try { AwsConnection.list_users(instance_id: instance_id) }
          response.to_result
        end

        def serialize(response)
          users = response.user_summary_list.reduce([]) { |list, user| list << user; list }

          Success(users)
        end

      end
    end
  end
end
