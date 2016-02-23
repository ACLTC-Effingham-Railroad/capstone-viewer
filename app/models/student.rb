class Student 
attr_reader :first_name, :last_name, :id

   def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @id = hash["id"]
    @linkedin_url = hash["linkedin_url"]
    @github_url = hash["github_url"]
    @email = hash["email"]
  end

  def full_name
    "#{@student_first_name} #{@student_last_name}"
  end

  def self.find(id)
    Student.new(Unirest.get("http://localhost:3001/students/#{id}").body)
  end

end
