require 'chefspec'

describe 'chef-env-vars::default' do
  let(:databag) {{ id: 'production', "API_KEY" => 'test' }}

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['vars'] = [{ name: 'API_KEY', databag: 'api_keys', item: 'production' }]
    end.converge(described_recipe)
  end

  before do
    Chef::EncryptedDataBagItem.stub(:load).with('api_keys', 'production').and_return databag
  end

  it 'does something' do
    expect(chef_run).to render_file('/etc/profile.d/variables.sh').with_content('export API_KEY=test')
  end
end
