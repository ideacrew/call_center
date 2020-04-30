# frozen_string_literal: true

module CallCenter
  module Operations
    module Contacts

      # Initiates a contact flow to place an outbound call to a customer
      #   There is a 60 second dialing timeout for this operation. If the call 
      #   is not connected after 60 seconds, it fails.
      class StartOutboundVoice
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @param [String] contact_flow_id (required)
        # @param [String] destination_phone_number (required)
        # @param [String] client_token
        # @param [String] source_phone_number
        # @param [String] queue_id
        # @param [Hash]   attributes
        # @return [Types::StartOutboundVoiceContactResponse] contact_id 
        def call(params)
          values    = yield validate(params)
          response  = yield start(values)

          Success(response)
        end

        private

        def validate(params)
          values = CallCenter::Validation::Contacts::StartOutboundVoiceContract.new.call(params)
          values.success? ? Success(values) : Failure(values)
        end

        def start(values)
          response = Try { AwsConnection.start_outbound_voice_contact(values.to_h) }
          response.to_result
        end
      end
    end
  end
end
