class Droplet
  def initialize(hash)
    hash['droplet'].each do |k,v|
      instance_variable_set("@#{k}", v)
    end
  end
end