RSpec.describe CallCenter do

  it "has a version number" do
    expect(CallCenter::VERSION).not_to be nil
  end

  let(:aws_access_key_id)         { 'AKIAWPLIN7CJFTUKV2FD' }
  let(:aws_secret_access_key_id)  { 'J+po0hyndk44w2+/oHISKEMDI2323KIsslj32pnq' }
  let(:aws_primary_region)        { 'us-east-1' }
  let(:aws_dr_region)             { 'us-east-2' }

  let(:aws_connect_instance_id)   { '027a44e8-d010-4b75-5ff3-a345ca8995da' }

  it "should perform a mock test in code below"
  it "creates a new call with appropriate ENV vars" do
    allow(ENV).to receive(:[]).with('AWS_ACCESS_KEY_ID').and_return(aws_access_key_id)
    allow(ENV).to receive(:[]).with('AWS_SECRET_ACCESS_KEY_ID').and_return(aws_secret_access_key_id)
    allow(ENV).to receive(:[]).with('AWS_REGION').and_return(aws_primary_region)

    # allow(ENV).to receive(:[]).with('AWS_BUCKET_ROOT_NAMESPACE').and_return(aws_s3_root_bucket)
    allow(ENV).to receive(:[]).with('AWS_CONNECT_INSTANCE_ID').and_return(aws_connect_instance_id)

    credentials     = Aws::Credentials.new(aws_access_key_id, aws_secret_access_key_id)
    client_creator  = double("clients", create: nil)

    # initiator     = Calls::CallInitiator.new(aws_connect_instance_id, client_creator)
    # initiator       = CallCenter::Operations::Clients::Create.new.call(credentials: credentials, region: aws_primary_region)
    # initiator.run

    # call_data       = { credentials: credentials, region: aws_primary_region }
    # expect(client_creator).to have_received(:create).with(call_data)
  end

end
