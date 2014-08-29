require 'spec_helper'

describe command('apparmor_status') do
  it { should return_stdout /\/usr\/bin\/apparmor_test/ }
end
