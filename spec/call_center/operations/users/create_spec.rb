# frozen_string_literal: true

require 'spec_helper'
require 'support/call_center_data_seed'

RSpec.describe CallCenter::Operations::Users::Create do
  include CallCenterDataSeed

  let(:instance_id)           { call_center_instance_id }
  let(:identity_info)         { identity_info_hash }
  let(:phone_config)          { phone_config_hash }
  let(:username)              { username_value }
  let(:password)              { "Best_007_Ever!" }

  let(:agent_profile_id)          { security_profile_id_by_name("Agent") }
  let(:security_profile_ids)      { [agent_profile_id] }

  let(:basic_routing_profile_id)  { routing_profile_id_by_name("Basic Routing Profile") }
  let(:routing_profile_id)        { basic_routing_profile_id }

  let(:hierarchy_group_id)    { "Tier 1" }
  let(:directory_user_id)     { "DirectoryUserId" }
  let(:tags)                  { {"TagKey" => "TagValue"} }

  let(:required_params)     {
    {
      instance_id:          instance_id,
      username:             username,
      security_profile_ids: security_profile_ids,
      routing_profile_id:   routing_profile_id,
      phone_config:         phone_config
    }
  }

  let(:optional_params)     {
    {
      password: password,
      identity_info: identity_info,
      # hierarchy_group_id: hierarchy_group_id,
      # directory_user_id: directory_user_id,
      # tags: tags,
    }
  }

  let(:all_params)          { required_params.merge(optional_params) }

  describe "Adding a user to the call center" do

    context "given valid params for a new user" do
      let(:new_user)    { all_params }

      it 'should create the user and respond with :user_id and arn: values' do
        response = subject.call(new_user)

        expect(response.value!.data).to be_a Aws::Connect::Types::CreateUserResponse
        expect(response.value!.data.to_h.keys).to eq [:user_id, :user_arn]
      end

      context 'and given params for a new user with an already existing user_id' do
        it 'should throw an error' do
          expect(subject.call(new_user).failure).to be_a Aws::Connect::Errors::InvalidRequestException
        end
      end

      after(:context) do
        users = CallCenter::Operations::Users::List.new.call(instance_id: call_center_instance_id)
        demo_user = users.value!.find { |user| user.to_h[:username] == username_value }
        CallCenter::Operations::Users::Delete.new.call(instance_id: call_center_instance_id, user_id: demo_user[:id])
      end
    end

  end
end
