# frozen_string_literal: true

module CallCenterDataSeed
  # module Shared

  SECURITY_PROFILE_SUMMARIES =
  [

  ]

  ROUTING_PROFILE_SUMMARIES =
  [

  ]

  def call_center_instance_id
    CallCenter::InstanceId
  end

  def username_value
    "demo_1"
  end

  def identity_info_hash
    {
      first_name: "Dem",
      last_name:  "Onstration",
      email: "demo@me.com"
    }
  end

  def phone_config_hash
    {
      phone_type: "SOFT_PHONE", # required, accepts SOFT_PHONE, DESK_PHONE
      auto_accept: true,
      after_contact_work_time_limit: 1,
      desk_phone_number: "+12025551212",
    }
  end

  def outbound_contact_flow_id
    ''
  end

  def agent_queue_id
    ''
  end

  def security_profile_id_by_name(name)
    profile = SECURITY_PROFILE_SUMMARIES.find { |profile| profile[:name] == name }
    profile[:id]
  end

  def routing_profile_id_by_name(name)
    profile =ROUTING_PROFILE_SUMMARIES.find { |profile| profile[:name] == name }
    profile[:id]
  end


end
