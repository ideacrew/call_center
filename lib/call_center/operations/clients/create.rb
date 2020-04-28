# frozen_string_literal: true

module CallCenter
  module Operations
    module Clients

      # Establish a connection instance to Amazon Connect
      class Create
        send(:include, Dry::Monads[:result, :do])

        # @param [Aws::Credentials] credentials
        # @param [String] region
        # @return [Aws::Connect::Client] response
        def call(params)
          values  = yield validate_credentials(params)
          values  = yield validate_region(params)

          client  = yield create(values)
          Success(client)
        end

        private

        def validate_region(params)
          params[:region].to_s.empty? ? Failure("region attribute required") : Success(params.to_h)
        end

        def validate_credentials(params)
          if params[:credentials].is_a?(Aws::Credentials) && params[:credentials].set?
            Success(params.to_h)
          else
            Failure("error validating credentials")
          end
        end

        def create(values)
          client  = Aws::Connect::Client.new(credentials: values[:credentials], region: values[:region])
          Success(client)
        end
        
      end
    end
  end
end