# frozen_string_literal: true

module CallCenter
  module Operations
    module Clients

      # Establish a connection instance to Amazon Connect
      class Create
        send(:include, Dry::Monads[:list, :result, :validated, :do, :try])

        # @param [Aws::Credentials] credentials
        # @param [String] region
        # @return [Aws::Connect::Client] response
        def call(params)
          region, credentials = yield List::Validated[
            validate_region(params[:region]),
            validate_credentials(params[:credentials]),
          ].traverse.to_result


          client     = yield create(region, credentials)
          connection = yield connect(client)

          Success(connection)
        end

        private


        def validate_region(region)
          if region.present?
            Valid(region)
          else
            Invalid("region missing")
          end
        end

        def validate_credentials(credentials)
          if credentials.is_a?(Aws::Credentials) && credentials.set?
            Valid(credentials)
          else
            Invalid("invalid credentials #{credentials}")
          end
        end

        def create(region, credentials)
          client  = Aws::Connect::Client.new(credentials: credentials, region: region)
          
          Success(client)
        end

        def connect(client)
          Try(Aws::Connect::Errors::InvalidRequestException) { Aws::Connect::Resource.new(client: client).client }.to_result.bind do |result|
            if result
              CallCenter.const_set("AwsConnection", result)
              Success(result)
            else
              Failure("AWS connection failed!!")
            end
          end
        end
      end
    end
  end
end
