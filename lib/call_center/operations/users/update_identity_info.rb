# frozen_string_literal: true

module Operations
  module Users

    # Provides summary information about the users for the specified Amazon Connect instance
    class UpdateIdentityInfo
      send(:include, Dry::Monads[:result, :do])

      # @param [String] instance_id
      # @param [String] next_token
      # @param [Integer] max_results
      # @return [Aws::Connect::Types::ListUsersResponse] response
      def call(params)
        values    = yield validate(params)
        response  = yield update_identity_info(values)

        Success(response)
      end

      private

      def validate(params)
        # result = CallCenter::Validation::Users::UserListContract.new.call(params)
        # result.success? ? Success(result.to_h) : Failure(result)
      end

      def update_identity_info(values)
        # response = Aws::Connect::Client.list_users(values)

        # Success(response)
      end

    end
  end
end
