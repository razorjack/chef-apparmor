#
# Cookbook Name:: apparmor
# Definition:: apparmor_profile
#

define :apparmor_profile, :restart_service => nil, :source => nil, :cookbook => nil do

  params[:source] ||= params[:name]

  # include the recipe that has apparmor prerequisites
  include_recipe 'apparmor::default'

  # must define the service here
  # because a definition can't notify resources outside the definition
  if params[:restart_service]
    service params[:restart_service] do
      action :nothing
    end
  end

  execute 'load-profile' do
    command "cat /etc/apparmor.d/#{params[:name]} | apparmor_parser -r"
    action :nothing
    notifies :restart, "service[#{params[:restart_service]}]" if params[:restart_service]
  end

  cookbook_file "/etc/apparmor.d/#{params[:name]}" do
    source params[:source]
    cookbook params[:cookbook] if params[:cookbook]
    owner 'root'
    mode '0644'
    notifies :run, 'execute[load-profile]', :immediately
  end

end
