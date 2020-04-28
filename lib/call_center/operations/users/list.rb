# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Provides summary information about the users for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])

        # @param [String] instance_id (required)
        # @return [Aws::Connect::Types::ListUsersResponse] response
        def call(params)
          values    = yield validate(params)
          response  = yield list(values)

          Success(response)
        end

        private

        def validate(params)
          params[:instance_id].to_s.empty? ? Failure("invalid instance_id") : Success(params.to_h)
        end

        def list(values)
          response = AwsConnection.list_users(values)
          users = response.user_summary_list.reduce([]) { |list, user| list << user; list }

          Success(users)

        rescue Aws::Connect::Errors::ServiceError
          Failure("error accessing user list for #{values}")
        end

      end
    end
  end
end
