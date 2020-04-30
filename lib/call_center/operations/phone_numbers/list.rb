# frozen_string_literal: true

module CallCenter
  module Operations
    module PhoneNumbers

      # Provides summary information about the {Aws::Connect::Types::PhoneNumberSummary PhoneNumber} for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @return [Aws::Connect::Types::LisPhoneNumbersResponse] response
        def call(instance_id:)
          response          = yield list(instance_id)
          routing_profiles  = yield serialize(response)

          Success(routing_profiles)
        end

        private

        def list(instance_id)
          response = Try { AwsConnection.list_phone_numbers(instance_id: instance_id) }
          response.to_result
        end

        def serialize(response)
          phone_numbers = response.phone_number_summary_list.reduce([]) { |list, phone_number| list << phone_number; list }

          Success(phone_numbers)
        end

      end
    end
  end
end
