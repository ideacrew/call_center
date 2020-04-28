# frozen_string_literal: true

module CallCenter
  module Operations
    module Contacts
      class UpdateAttributes
        class Stop
          send(:include, Dry::Monads[:result, :do])

          # @param [String] instance_id The identifier of the Amazon Connect instance
          # @param [String] contact_id The ID of the contact
          # @return [Seahorse::Client::Response] An empty {Seahorse::Client::Response Response}
          def call(params)
            values    = yield validate(params)
            response  = yield perform(values)

            Success(response)
          end

          private

          def validate(params)
          end

          def perform(values)
          end
        end
      end
    end
  end
end
