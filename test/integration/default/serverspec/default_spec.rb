require 'spec_helper'

describe command('apparmor_status') do
  it { should return_stdout /apparmor module is loaded/ }
end
