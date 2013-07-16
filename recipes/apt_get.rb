execute "curl http://apt.basho.com/gpg/basho.apt.key | apt-key add -" do
  only_if { `apt-key list | grep "Basho Technologies"`.strip == "" }
end

execute 'bash -c "echo deb http://apt.basho.com $(lsb_release -sc) main > /etc/apt/sources.list.d/basho.list"' do
  not_if { File.exists?("/etc/apt/sources.list.d/basho.list") }
  notifies :run, "execute[update_apt_get]", :immediately
end

execute "update_apt_get" do
  command "apt-get update"
  action :nothing
end

package "riak"