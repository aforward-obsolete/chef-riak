

template "#{node[:monit][:confd_dir]}/riak.conf" do
  source "monit_process_matching.conf.erb"
  owner "root"
  group "root"
  mode 0700
  variables( 
    :name => "riak", 
    :match => node[:riak][:beam], 
    :start => "#{node[:riak][:bin_dir]}/riak start", 
    :stop => "#{node[:riak][:bin_dir]}/riak stop",
    :host => node[:riak][:host],
    :port => node[:riak][:port],
    :request_path => "/"
  )
  notifies :reload, resources(:service => "monit"), :delayed
  action :create
end