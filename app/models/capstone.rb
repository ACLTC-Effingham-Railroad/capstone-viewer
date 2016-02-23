class Capstone
  attr_reader :id
  attr_accessor :name, :description, :url, :screenshot, :student_id
  

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @description = hash["description"]
    @url = hash["url"]
    @screenshot = hash["screenshot"]
    @created_at = hash["created_at"]
    @udpated_at = hash["udpated_at"]
    @student_id = hash["student_id"]

    #add in correct details
  end

  def student
    Student.new(Unirest.get("http://localhost:3001/students").body)
  end

  def self.find(id)
    Capstone.new(Unirest.get("http://localhost:3001/capstones/#{id}").body)
  end


  def self.all
    capstone_array = Unirest.get("http://localhost:3001/capstones").body
       capstones = []

   capstone_array.each do |capstone|
    # capstone.each do |item|
     capstones << Capstone.new(capstone)
    # end
   end

   capstones
 end

  def self.search(search)
    Unirest.where("name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
