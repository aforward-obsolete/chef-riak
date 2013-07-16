
include_recipe("riak::apt_get")
include_recipe "riak::monit" if node[:riak][:include_monit]
