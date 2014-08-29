require 'spec_helper'

describe 'apparmor::default' do
   let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

   it 'installs apparmor utils' do
     expect(chef_run).to install_package('apparmor-utils')
   end

   it 'installs apparmor profiles' do
     expect(chef_run).to install_package('apparmor-profiles')
   end

  it 'enables apparmor service' do
    expect(chef_run).to enable_service('apparmor')
  end

  it 'loads apparmor module' do
    expect(chef_run).to start_service('apparmor')
  end
end
