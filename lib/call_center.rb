require "call_center/version"
require "aws-sdk-connect"

require 'dry/validation'
require 'dry/monads/result'

require 'dry/monads'
require 'dry/monads/do'
require 'dry-struct'

require 'resource_registry'

require 'call_center/error'
require 'call_center/types'
require 'call_center/validation/application_contract'

require 'call_center/service'
require 'call_center/client'
require 'call_center/contact'
require 'call_center/hierarchy_group'
require 'call_center/identity_info'
require 'call_center/phone_config'
require 'call_center/queue'
require 'call_center/routing_profile'
require 'call_center/security_profile'
require 'call_center/user'
require 'call_center/asset'


# TODO
# Enable injection/query for values used in call_center_data_seed
# Enable mocking in rspec_helper
# CallCenter::Operations::Contacts::StartOutboundVoice - finish spec and get running
# CallCenter::Operations::Contacts::StartChat - build spec and get running
# 
# Create/complete entities/contracts for API resources (See list in Asset model)
# Add specs and verify spec coverage for entities/contracts


module CallCenter

  # credentials = Aws::SharedCredentials.new.credentials
  # region      = 'us-east-1'
  # client      = Operations::Clients::Create.new.call(credentials: credentials, region: region)

  # AwsConnection = Aws::Connect::Resource.new(client: client.value!).client if client.success?

  LoginURL      = "https://demo-covid.awsapps.com/connect/login"

  InstanceId    = ''
  
  call_recordings   = "covidmost/connect/demo-covid/CallRecordings"
  chat_transcripts  = "covidmost/connect/demo-covid/ChatTranscripts"
  exported_reports  = "covidmost/connect/demo-covid/Reports"

  conn_defaults = Aws::InstanceProfileCredentials.new(
    {
      retries: 1,
      ip_address: '169.254.169.254',
      port:               80,
      http_open_timeout:  1.0,
      http_read_timeout:  1.0,
      # delay:              # By default, failures are retried with exponential back-off, i.e. sleep(1.2 ** num_failures). You can pass a number of seconds to sleep between failed attempts, or a Proc that accepts the number of failures.
      http_debug_timeout: nil,  # HTTP wire traces are sent to this object. You can specify something like $stdout.
      token_ttl:          21600 # seconds
    }
  )

  #     begin
  #       # do stuff
  #     rescue Aws::Connect::Errors::ServiceError
  #       # rescues all Amazon Connect Service API errors
  #     end

  # def aws_credential(akid:, secret:)

  # end


  # def connect(region_name: "us-east-1", aws_credential:)

  #   client = Aws::Connect::Client.new(
  #     access_key_id:      akid,
  #     secret_access_key:  secret,
  #     region:             region_name,
  #     credentials:        credentials,
  #   )
  # end



end
