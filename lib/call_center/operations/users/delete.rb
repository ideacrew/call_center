# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Deletes a user account from the specified Amazon Connect instance
      class Delete
        send(:include, Dry::Monads[:result, :do])

        # @param [String] instance_id (required)
        # @param [String] user_id (required)
        # @return [Seahorse::Client::Response] response
        def call(params)
          values    = yield validate(params)
          response  = yield list(values)

          Success(response)
        end

        private

        def validate(params)
          if params.keys != [:instance_id, :user_id]
            Failure("instance_id and user_id are required")
          elsif params[:instance_id].to_s.empty? || params[:user_id].to_s.empty?
            Failure("iinstance_id and user_id values are required")
          else
            Success(params.to_h)
          end
        end

        def list(values)
          response = AwsConnection.delete_user(values)
          Success(response)

        rescue Aws::Connect::Errors::ServiceError
          Failure("error deleting user for #{values}")
        end

      end
    end
  end
end
