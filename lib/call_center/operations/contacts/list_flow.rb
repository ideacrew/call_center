# frozen_string_literal: true

module CallCenter
  module Operations
    module Contacts

      # Provides summary information about the {Aws::Connect::Types::ListContactFlowsSummary ListContactFlowsSummary} 
      #   for the specified Amazon Connect instance
      class ListFlow
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param [String] instance_id (required)
        # @param [Array<CallCenter::Types::ContactFlow>] contact_flow_types
        # @return [Array<Aws::Connect::Types::ListContactFlowsSummary>] response
        def call(params)
          values        = yield validate(params)
          response      = yield list(values)
          contact_flows = yield serialize(response)

          Success(contact_flows)
        end

        private

        def validate(params)
          values = CallCenter::Validation::Contacts::ListFlow.new.call(params)
          values.success? ? Success(values) : Failure(values)
        end

        def list(values)
          response = Try { AwsConnection.list_contact_flows(values.to_h) }
          response.to_result
        end

        def serialize(response)
          contact_flows = response.contact_flow_summary_list.reduce([]) { |list, flow| list << flow; list }

          Success(contact_flows)
        end

      end
    end
  end
end
