module RPS
  class CreateInvitation < UseCase
  	def run(inputs)
	  	host_id = inputs[:host_id]
	  	guest_id = inputs[:guest_id]
	  	users = RPS.db.users.keys #returns the user IDs in an array

	  	return failure(:no_host_id) if host_id != users.find {|user_id| user_id == host_id}
	  	return failure(:no_guest_id) if guest_id != users.find {|user_id| user_id == guest_id}
  		
  		invite = RPS.db.add_invitation(host_id, guest_id)

  		success :invite => invite
  	end



    # def run(inputs)
    #   name = inputs[:name]
    #   return failure(:no_name_given) if name == ""
    #   employee = TM.db.add_employee(inputs[:name])
    #   success :employee => employee
    # end
  end
end
