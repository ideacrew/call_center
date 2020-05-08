# frozen_string_literal: true

module CallCenter
  module Operations
    module Services

      # Establish a connection instance to Amazon Connect
      class Start
        send(:include, Dry::Monads[:result, :do])

        # @param [Aws::Credentials] credentials
        # @param [String] region
        # @return [Aws::Connect::Client] response 
        def call(registry)
          client = create_client(registry)
          attributes = get_feature_attrs(registry)
          feature = yield create_feature(attributes)
          Success(feature)
        end

        private


        def create_client(registry)
          credentials = Aws::SharedCredentials.new.credentials #do we need to fetch from resource registry?
          region      = registry[:aws].setting(:aws_region).item
          client      = CallCenter::Operations::Clients::Create.new.call(credentials: credentials, region: region)
          Object.set_const(CallCenter::AwsConnection) = Aws::Connect::Resource.new(client: client.value!).client if client.success?

          Success(client)
        end

        def get_feature_attrs(registry)
         attributes =  {
            key: :call_center,
              is_enabled: true,
              settings:
              [
                {key: :login_url,
                  item: CallCenter::LoginURL},
                {key: :instance_id,
                  item: registry[:aws].setting(:aws_connect_instance_id).item},
                {key: :call_recordings,
                  item: "covidmost/connect/demo-covid/CallRecordings"},
                {key: :chat_transcripts,
                  item: "covidmost/connect/demo-covid/ChatTranscripts"},
                {key: :exported_reports,
                  item: "covidmost/connect/demo-covid/Reports"}
              ]
          }

          Success(attributes)
        end

        def create_feature(attributes)
          feature = ResourceRegistry::Operations::Features::Create.new.call(attributes)

          Success(feature)
        end
      end
    end
  end
end