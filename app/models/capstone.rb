class Capstone
  attr_reader :id
  # attr_accessor :street_address, :city, :state, :zipcode, :country
  #adjust attr_accessor

  def initialize(hash)
    # @id = hash["id"]
    # @street_address = hash["street_address"]
    # @city = hash["city"]
    # @state = hash["state"]
    # @zipcode = hash["zipcode"]
    # @country = hash["country"]

    #add in correct details
  end

  def self.find(id)
    Capstone.new(Unirest.get("http://localhost:3001/capstones/#{id}").body)
  end

  def self.all
    Unirest.get("http://localhost:3001/capstones/#{id}").body.map { |api_location| Capstone.new(api_location) }
  end

  def self.search(search)
    where("capstone_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
