# frozen_string_literal: true

module CallCenterDataSeed
  module Shared

    def identity_info_hash
      {
        first_name: "James",
        last_name:  "Bond",
        email: "james.bond@mifive.gov"
      }
    end

    def phone_config_hash
      {
        phone_type: "SOFT_PHONE", # required, accepts SOFT_PHONE, DESK_PHONE
        auto_accept: false,
        after_contact_work_time_limit: 1,
        desk_phone_number: "+13015551212",
      }
    end

  end
end
