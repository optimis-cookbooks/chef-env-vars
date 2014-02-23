require 'chefspec'

describe 'chef-env-vars::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge described_recipe }

  context 'when the env vars databag does not have vars for the chef env' do
    it 'should not add any ENV vars' do
      expect(chef_run).to_not render_file '/etc/profile.d/variables.sh'
    end
  end

  context 'when the env vars databag has vars for the chef env' do
    let(:databag) {{ id: 'vars', "API_KEY" => { '_default' => 'test' }}}

    before do
      Chef::EncryptedDataBagItem.stub(:load).with('env', 'vars').and_return databag
    end

    it 'should add the ENV vars from the env vars databag' do
      expect(chef_run).to render_file('/etc/profile.d/variables.sh').with_content('export API_KEY=test')
    end
  end
end
