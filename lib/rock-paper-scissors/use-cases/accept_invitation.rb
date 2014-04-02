module RPS
  class AcceptInvitation < UseCase
  	def run(inputs)
	  	invite_id = inputs[:invite_id]
      host_id = inputs[:host_id]
	  	guest_id = inputs[:guest_id]

	  	users = RPS.db.users.keys #returns the user IDs in an array
      invites = RPS.db.invites.keys

	  	return failure(:no_host_id) if host_id != users.find {|user_id| user_id == host_id}
      return failure(:no_guest_id) if guest_id != users.find {|user_id| user_id == guest_id}
	  	return failure(:invalid_invite_id) if invite_id != invites.find {|invite_key| invite_key == invite_id}
  		
  		invite = RPS.db.accept_invite(invite_id, host_id, guest_id)

  		success :invite => invite
  	end #end def run
  end #end class
end #end RPS
