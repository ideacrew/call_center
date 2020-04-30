# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CallCenter::Operations::Users::List do

  context "given a missing instance_id" do
  end

  context "given a valid instance_id" do
    let(:instance_id) { CallCenter::InstanceId }

    it "should return existing users" do
      list_users_response = subject.call(instance_id: instance_id)
      expect(list_users_response.success?).to be_truthy
      expect(list_users_response.value![0]).to be_a Aws::Connect::Types::UserSummary
    end
  end

end