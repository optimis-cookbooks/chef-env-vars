require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe file('/etc/profile.d/variables.sh') do
  it { should be_file }
  its(:content) { should match /export PT_BILLING_API_V2_KEY=ssr928a34afdd1041g3b58g87e12c9a114d4919eadaef124/ }
end
