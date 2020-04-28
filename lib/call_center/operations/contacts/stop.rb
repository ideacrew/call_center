# frozen_string_literal: true

module CallCenter
  module Operations
    module Contacts

      # End the specified contact
      class Stop
        send(:include, Dry::Monads[:result, :do])

        # @param [String] instance_id The identifier of the Amazon Connect instance
        # @param [String] contact_id The ID of the contact
        # @return [Seahorse::Client::Response] An empty {Seahorse::Client::Response Response}
        def call(instance_id:, contact_id:)

          values    = yield validate(instance_id, contact_id)
          response  = yield stop(values)

          Success(response)
        end

        private

        def validate(instance_id, contact_id)
          if instance_id.empty? || contact_id.empty?
            Failure("instance_id and contact_id values are required")
          else
            Success({instance_id: instance_id, contact_id: contact_id})
          end
        end

        def stop(values)
          response = CallCenter::Client.stop_contact(values.to_h)
          Success(response)
        end

      end
    end
  end
end
