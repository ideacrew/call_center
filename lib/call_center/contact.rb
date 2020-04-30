# frozen_string_literal: true

require_relative 'operations/contacts/start_outbound_voice'
require_relative 'operations/contacts/start_chat'
require_relative 'operations/contacts/list_flow'
require_relative 'operations/contacts/stop'

require_relative 'validation/contacts/list_flow_contract'
require_relative 'validation/contacts/start_outbound_voice_contract'

module CallCenter

  # Define a Contact together with its settings, code hook for dependency injection, and configuration UI attributes 
  class Contact < Dry::Struct

  end
end