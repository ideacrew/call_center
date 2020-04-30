# frozen_string_literal: true

module CallCenter
  module Operations
    module SecurityProfiles

      # Provides summary information about the {Aws::Connect::Types::SecurityProfileSummary SecurityProfileSummary} for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @return [Array<Aws::Connect::Types::SecurityProfileSummary>] response
        def call(instance_id:)
          response          = yield list(instance_id)
          security_profiles = yield serialize(response)

          Success(security_profiles)
        end

        private

        def list(instance_id)
          response = Try { AwsConnection.list_security_profiles(instance_id: instance_id) }
          response.to_result
        end

        def serialize(response)
          security_profiles = response.security_profile_summary_list.reduce([]) { |list, profile| list << profile; list }

          Success(security_profiles)
        end

      end
    end
  end
end
