module RPS
	class User

	  attr_reader :name, :id
	  attr_accessor :win_count, :username, :password

	  @@user_id = 0

	  def initialize(name, username=nil, password=nil)
	    @name = name
	    @@user_id += 1
	    @id = @@user_id
	    @win_count = 0
	    @username = username
	    @password = password
	  end
	end
end