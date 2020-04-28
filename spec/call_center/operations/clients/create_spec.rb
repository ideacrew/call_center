# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CallCenter::Operations::Clients::Create do

  let(:credentials) { Aws::SharedCredentials.new.credentials }
  let(:region)      { 'us-east-1' }

  context "Verify spec setup dependency" do
    it "should find test credentials" do
      expect(credentials.set?).to be_truthy
    end
  end

  context 'When valid params are passed' do
    subject { described_class.new.call(credentials: credentials, region: region) }

    it "should return a Amazon Connect Client Instance" do
      expect(subject).to be_a Dry::Monads::Result::Success
      expect(subject.value!).to be_a Aws::Connect::Client
    end
  end

  context "When params are passed without credentials" do
    subject { described_class.new.call(region: region) }

    it "should return an error" do
      expect(subject.failure?).to be_truthy
      expect(subject.failure).to eq "error validating credentials"
    end
  end

end
