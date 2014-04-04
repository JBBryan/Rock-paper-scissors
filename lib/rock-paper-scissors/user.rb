module RPS
	class User

	  attr_reader :name
	  attr_accessor :win_count, :username, :password, :id

	  @@user_id = 0

	  def initialize(name, username, password)
	    @name = name
	    @@user_id += 1
	    @id = @@user_id
	    @win_count = 0
	    @username = username
	    @password = password
	  end
	end
end