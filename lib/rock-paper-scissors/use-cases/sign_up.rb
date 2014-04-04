module RPS
  class SignUp < UseCase
  	def run(inputs)
	  	name = inputs[:name]
      username = inputs[:username]
	  	password = inputs[:password]

      existing_usernames = RPS.db.get_users #returns an array of usernames
      existing_user = existing_usernames.find {|user| user.username == username}

	  	return failure(:username_exists) if existing_user != nil
      return failure(:password_too_short) if password.length <= 6
      return failure(:password_not_secure) if password == username
	  	# return failure(:invalid_invite_id) if invite_id != invites.find {|invite_key| invite_key == invite_id}
  		
  		# invite = RPS.db.accept_invite(invite_id, host_id, guest_id)
      sign_up = RPS.db.sign_up(name, username, password)

  		success :sign_up => sign_up

  	end #end def run
  end #end class
end #end RPS
