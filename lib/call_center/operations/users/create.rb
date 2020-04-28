# frozen_string_literal: true

module CallCenter
  module Operations
    module Users

      # Create a new user account for the specified Amazon Connect instance
      class Create
        send(:include, Dry::Monads[:result, :do])

        #
        def call(params)
          values  = yield validate(params)
          user    = yield create(values)

          Success(CallCenter::Client)
        end

        private

        def validate(params)
          result = CallCenter::Validation::Users::UserContract.new.call(params)
          result.success? ? Success(result.to_h) : Failure(result)
        end

        def create(values)
          response = Aws::Connect::Client.create_user(values)
          Success(response)

        rescue CallCenter::Error::CreateUserError, "error creating user: #{values}"
        end
      end

    end
  end
end
