# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CallCenter::Operations::Users::Create do
  include CallCenterDataSeed

  let(:username)              { "daniel_craig" }
  let(:password)              { "best_bond_ever" }
  let(:identity_info)         { Shared.identity_info_hash }
  let(:phone_confg)           { Shared.phone_config_seed_hash }
  let(:directory_user_id)     { "DirectoryUserId" }
  let(:security_profile_ids)  { ["SecurityProfileId"] }
  let(:routing_profile_id)    { "RoutingProfileId" }
  let(:hierarchy_group_id)    { "HierarchyGroupId" }
  let(:instance_id)           { "InstanceId" }
  let(:tags)                  { {"TagKey" => "TagValue"} }

  let(:user)                  {
    {
      username:               username,             # required
      password:               password,
      security_profile_ids:   security_profile_ids, # required
      routing_profile_id:     routing_profile_id,   # required
      instance_id:            instance_id,          # required
      identity_info:          identity_info,
      phone_config:           phone_config,
      directory_user_id:      directory_user_id,
      hierarchy_group_id:     hierarchy_group_id,
      tags:                   tags,
    }
  }
end
