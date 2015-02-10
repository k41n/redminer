require 'rails_helper'

describe 'Droplets' do

  let(:fake_droplets_list) {
    { droplets: [{"id"=>3203320, "name"=>"staging-training-hours", "memory"=>2048, "vcpus"=>2, "disk"=>40, "locked"=>false, "status"=>"active", "kernel"=>{"id"=>2233, "name"=>"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic", "version"=>"3.13.0-37-generic"}, "created_at"=>"2014-11-18T18:20:18Z", "features"=>["virtio"], "backup_ids"=>[], "snapshot_ids"=>[], "image"=>{"id"=>6918990, "name"=>"14.04 x64", "distribution"=>"Ubuntu", "slug"=>nil, "public"=>false, "regions"=>["nyc1", "ams1", "sfo1", "nyc2", "ams2", "sgp1", "lon1", "nyc3", "ams3", "nyc3"], "created_at"=>"2014-10-17T20:24:33Z", "min_disk_size"=>20}, "size_slug"=>"2gb", "networks"=>{"v4"=>[{"ip_address"=>"178.62.150.250", "netmask"=>"255.255.192.0", "gateway"=>"178.62.128.1", "type"=>"public"}], "v6"=>[]}, "region"=>{"name"=>"Amsterdam 2", "slug"=>"ams2", "sizes"=>[], "features"=>["virtio", "private_networking", "backups", "metadata"], "available"=>nil}}, {"id"=>3262675, "name"=>"ejabberd", "memory"=>1024, "vcpus"=>1, "disk"=>30, "locked"=>false, "status"=>"active", "kernel"=>{"id"=>2233, "name"=>"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic", "version"=>"3.13.0-37-generic"}, "created_at"=>"2014-11-23T18:13:09Z", "features"=>["virtio"], "backup_ids"=>[], "snapshot_ids"=>[], "image"=>{"id"=>6918990, "name"=>"14.04 x64", "distribution"=>"Ubuntu", "slug"=>nil, "public"=>false, "regions"=>["nyc1", "ams1", "sfo1", "nyc2", "ams2", "sgp1", "lon1", "nyc3", "ams3", "nyc3"], "created_at"=>"2014-10-17T20:24:33Z", "min_disk_size"=>20}, "size_slug"=>"1gb", "networks"=>{"v4"=>[{"ip_address"=>"95.85.47.245", "netmask"=>"255.255.255.0", "gateway"=>"95.85.47.1", "type"=>"public"}], "v6"=>[]}, "region"=>{"name"=>"Amsterdam 2", "slug"=>"ams2", "sizes"=>[], "features"=>["virtio", "private_networking", "backups", "metadata"], "available"=>nil}}] }
  }

  let(:fake_droplet_created) {
    { "droplet"=>{"id"=>3755361, "name"=>"test", "memory"=>1024, "vcpus"=>1, "disk"=>30, "locked"=>true, "status"=>"new", "kernel"=>{"id"=>2924, "name"=>"Ubuntu 14.04 x64 vmlinuz-3.13.0-43-generic", "version"=>"3.13.0-43-generic"}, "created_at"=>"2015-01-12T19:33:39Z", "features"=>["backups", "virtio"], "backup_ids"=>[], "snapshot_ids"=>[], "image"=>{}, "size_slug"=>"1gb", "networks"=>{}, "region"=>{}}, "links"=>{"actions"=>[{"id"=>41111121, "rel"=>"create", "href"=>"https://api.digitalocean.com/v2/actions/41111121"}]} }
  }

  it 'can request list of droplets existing' do
    stub_request(:get, "https://api.digitalocean.com/v2/droplets").
      to_return(status: 200, body: fake_droplets_list.to_json)

    droplets = Droplets.instance.list
    expect(droplets).to have(2).items
  end

  it 'can create droplet' do
    stub_request(:post, "https://api.digitalocean.com/v2/droplets").
     to_return(status: 200, body: fake_droplet_created.to_json)
    expect(Droplets.instance.create('test')).to be_kind_of(Droplet)
  end
end