require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe file('/etc/profile.d/variables.sh') do
  it { should be_file }
end
