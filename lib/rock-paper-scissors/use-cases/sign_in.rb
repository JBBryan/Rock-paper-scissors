module RPS
  class SignIn < UseCase
  	def run(inputs)
      username = inputs[:username]
	  	password = inputs[:password]

      existing_usernames = RPS.db.get_users #returns an array of usernames
      existing_user = existing_usernames.find {|user| user.username == username}
	  	

      return failure(:username_does_not_exist) if existing_user == nil
      return failure(:password_does_not_match) if existing_user.password != password
  		
      sign_in = RPS.db.sign_in(username, password)

  		success :sign_in => sign_in

  	end #end def run
  end #end class
end #end RPS