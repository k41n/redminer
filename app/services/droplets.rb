class Droplets
  include Singleton

  DO_API = 'https://api.digitalocean.com/v2/droplets'

  def list
    request = Typhoeus::Request.new(
      DO_API,
      method: :get,
      headers: { 'Authorization' => "Bearer #{App.do_key}"}
    )
    JSON.parse(request.run.body)['droplets']
  end

  def create(name)
    request = Typhoeus::Request.new(
      DO_API,
      method: :post,
      body: {
        name: name,
        region: 'ams2',
        size: '1gb',
        image: 'ubuntu-14-04-x64',
        ssh_keys: [],
        backups: false,
        ipv6: false,
        user_data: nil,
        private_networking: nil
      },
      headers: { 'Authorization' => "Bearer #{App.do_key}"}
    )
    response = JSON.parse(request.run.body)
    if response.has_key?('droplet')
      Droplet.new(response)
    else
      nil
    end
  end
end