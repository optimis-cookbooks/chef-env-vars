require 'chefspec'

describe 'chef-env-vars::default' do
  context 'when the node attribute #vars is not configured' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['vars'] = nil
      end.converge(described_recipe)
    end

    it 'does not add the ENV vars from the variables databag' do
      expect(chef_run).to_not render_file '/etc/profile.d/variables.sh'
    end
  end

  context 'when the node attribute #vars is configured' do
    let(:databag) {{ id: 'vars', "API_KEY" => { '_default' => 'test' }}}

    before do
      Chef::EncryptedDataBagItem.stub(:load).with('env', 'vars').and_return databag
    end

    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['vars'] = [ 'API_KEY' ]
      end.converge(described_recipe)
    end

    it 'adds the ENV vars from the variables databag' do
      expect(chef_run).to render_file('/etc/profile.d/variables.sh').with_content('export API_KEY=test')
    end
  end
end
