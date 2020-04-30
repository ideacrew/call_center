module CallCenter
  class Asset

    def self.pretty_print(name, list)
      puts "=== #{name}\n"

      list.each do |obj| 
        obj.to_h.each_pair { |k,v| puts "    #{k.to_sym} #{v.to_s}\n"}
        puts "\n"
      end
      puts "\n"
    end

    def self.collect_all(instance_id: CallCenter::InstanceId)

      users             = CallCenter::Operations::Users::List.new.call(instance_id: instance_id)
      queues            = CallCenter::Operations::Queues::List.new.call(instance_id: instance_id)
      routing_profiles  = CallCenter::Operations::RoutingProfiles::List.new.call(instance_id: instance_id)
      security_profiles = CallCenter::Operations::SecurityProfiles::List.new.call(instance_id: instance_id)
      phone_numbers     = CallCenter::Operations::PhoneNumbers::List.new.call(instance_id: instance_id)
      contact_flows     = CallCenter::Operations::Contacts::ListFlow.new.call(instance_id: instance_id)

      # hours_of_operations
      # tags_for_resource
      # user_hierarchy_group

      pretty_print("Users", users.value!)
      pretty_print("Queues", queues.value!)
      pretty_print("Routing Profiles", routing_profiles.value!)
      pretty_print("SecurityProfiles", security_profiles.value!)
      pretty_print("PhoneNumbers", phone_numbers.value!)
      pretty_print("ContactFlows", contact_flows.value!)
    end

    # Gets
    # contact_attributes
    # current_metric_data
    # federation_token
    # metric_data

    # Describes
    # user
    # user_hierarchy_group
    # user_hierarchy_structure

    # Commmunication methods
    # start_chat_contact
    # start_outbound_voice_contact

    # Other methods
    # untag_resource
    # update_contact_attributes
    # update_user_hierarchy
    # update_user_identity_info
    # update_user_phone_config
    # update_user_routing_profile
    # update_user_security_profiles
  end
end
