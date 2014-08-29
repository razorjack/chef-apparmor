require 'spec_helper'

describe 'apparmor::test_definition' do
   let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

   it 'creates profile' do
     expect(chef_run).to create_cookbook_file('/etc/apparmor.d/usr.bin.apparmor_test')
   end

# This does not happen during an rpec run
# but I can verify it happens during an actual chef run in test-kitchen
#   it 'loads profile' do
#     expect(chef_run).to run_execute('load-profile')
#   end

end
