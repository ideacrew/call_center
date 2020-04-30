# frozen_string_literal: true

require 'spec_helper'
require 'support/call_center_data_seed'

RSpec.describe CallCenter::User do
  include CallCenterDataSeed

  let(:username)              { "daniel_craig" }
  let(:password)              { "best_bond_ever" }
  let(:identity_info)         { identity_info_hash }
  let(:phone_config)          { phone_config_hash }
  let(:directory_user_id)     { "DirectoryUserId" }
  let(:security_profile_ids)  { ["SecurityProfileId"] }
  let(:routing_profile_id)    { "RoutingProfileId" }
  let(:hierarchy_group_id)    { "HierarchyGroupId" }
  let(:instance_id)           { "InstanceId" }
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
      directory_user_id: directory_user_id,
      hierarchy_group_id: hierarchy_group_id,
      # tags: tags,
    }
  }

  let(:all_params)          { required_params.merge(optional_params) }

  context "Validation with invalid input" do
    context "Given hash params are missing required attributes" do
      let(:error_hash)  { {} }

      it "should fail validation" do
        expect{described_class.new(optional_params)}.to raise_error Dry::Struct::Error
      end
    end
  end

  context "Validation with valid input" do
    context "Given hash params include only required attributes" do
      it "should pass validation" do
        expect(described_class.new(required_params)).to be_a CallCenter::User
        expect(described_class.new(required_params).to_h).to eq required_params
      end
    end

    context "Given hash params include all required and optional attributes" do
      it "should pass validation" do
        expect(described_class.new(all_params)).to be_a CallCenter::User
        expect(described_class.new(all_params).to_h).to eq all_params
      end
    end
  end


end
