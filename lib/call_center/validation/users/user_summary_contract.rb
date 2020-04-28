# frozen_string_literal: true

module CallCenter
  module Users

    # Schema and validation rules for the {CallCenter::UserSummary} domain model
    class UserSummaryContract < CallCenter::Validation::ApplicationContract

      # @!method call(opts)
      # @param [Hash] opts the parameters to validate using this contract
      # @option opts [String] :arn required
      # @option opts [String] :id required
      # @option opts [String] :username required
      # @return [Dry::Monads::Result::Success] if params pass validation
      # @return [Dry::Monads::Result::Failure] if params fail validation
      params do
        required(:arn).filled(:string)
        required(:id).filled(:string)
        required(:username).filled(:string)
      end

    end
  end
end
