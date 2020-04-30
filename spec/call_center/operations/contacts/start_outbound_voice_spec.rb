# frozen_string_literal: true

require 'spec_helper'
require 'support/call_center_data_seed'

RSpec.describe CallCenter::Operations::Contacts::StartOutboundVoice do
  include CallCenterDataSeed

  let(:instance_id)               { call_center_instance_id }
  let(:contact_flow_id)           { outbound_contact_flow_id }
  let(:destination_phone_number)  { '+12026883140' }
  let(:queue_id)                  { agent_queue_id }
  let(:source_phone_number)       { '+12064389891' }

  let(:params)  {
    {
      instance_id: instance_id,
      contact_flow_id: contact_flow_id,
      destination_phone_number: destination_phone_number,
      source_phone_number: source_phone_number,
      # queue_id: queue_id,
    }
  }

  context 'When valid params are passed' do

    it "should initiate a call" do
      id = subject.call(params)
binding.pry

    end
  end

end
