# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Deletes a user account from the specified Amazon Connect instance
      class Describe
        send(:include, Dry::Monads[:result, :do])

        # @param [String] instance_id (required)
        # @param [String] user_id (required)
        # @return [Aws::Connect::Types::DescribeUserResponse] response
        def call(instance_id:, user_id:)
          values    = yield validate(params)
          response  = yield list(values)

          Success(response)
        end

        private

        def validate(params)
          if params[:instance_id].to_s.empty? || params[:user_id].to_s.empty?
            Failure("instance_id and user_id are required")
          else
            Success(params.to_h)
          end
        end

        def list(values)
          response = AwsConnection.describe_user(values)
          user = CallCenter::User.new.call(response.user.to_h)
          Success(user)

        rescue Aws::Connect::Errors::ServiceError
          Failure("error describing user for #{values}")
        end

      end
    end
  end
end
