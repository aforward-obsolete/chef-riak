include_attribute "monit"

default[:riak][:bin_dir] = "/usr/sbin"
default[:riak][:host] = "localhost"
default[:riak][:port] = "8098"
default[:riak][:beam] = "/usr/lib/riak/erts-5.9.1/bin/beam.smp"

default[:riak][:include_monit] = true