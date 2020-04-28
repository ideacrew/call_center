# frozen_string_literal: true

module CallCenter
  module Users

    # Schema and validation rules for the {CallCenter::CreateUseResponse} domain model
    class CreateUserResponseContract < CallCenter::Validation::ApplicationContract

      # @!method call(opts)
      # @param [Hash] opts the parameters to validate using this contract
      # @option opts [String] :user_id required
      # @option opts [String] :user_arn required
      # @return [Dry::Monads::Result::Success] if params pass validation
      # @return [Dry::Monads::Result::Failure] if params fail validation
      params do
        required(:user_id).value(:string)
        required(:user_arn).value(:string)
      end

    end
  end
end
