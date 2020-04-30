# frozen_string_literal: true

module CallCenter
  module Operations
    module RoutingProfiles

      # Provides summary information about the {Aws::Connect::Types::RoutingProfileSummary RoutingProfileSummary} for the specified Amazon Connect instance
      class List
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @return [Array<Aws::Connect::Types::RoutingProfileSummary>] response
        def call(instance_id:)
          response          = yield list(instance_id)
          routing_profiles  = yield serialize(response)

          Success(routing_profiles)
        end

        private

        def list(instance_id)
          response = Try { AwsConnection.list_routing_profiles(instance_id: instance_id) }
          response.to_result
        end

        def serialize(response)
          routing_profiles = response.routing_profile_summary_list.reduce([]) { |list, profile| list << profile; list }

          Success(routing_profiles)
        end

      end
    end
  end
end
