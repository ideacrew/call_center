# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Create a new user account for the specified Amazon Connect instance
      class Create
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        #
        def call(params)
          values  = yield validate(params)
          user    = yield create(values)

          Success(user)
        end

        private

        def validate(params)
          values = CallCenter::Validation::Users::UserContract.new.call(params)
          values.to_result
        end

        def create(values)
          response = Try { AwsConnection.create_user(values.to_h) }
          response.to_result
        end
      end

    end
  end
end
