module RPS
  class PlayMove < UseCase
  	def run(inputs)
      match_id = inputs[:match_id]
      move = inputs[:move]
  		session_key = inputs[:session_key]
	  	
      users = RPS.db.users.keys #returns the user IDs in an array
	  	session = RPS.db.get_session(session_key)
	  	host = RPS.db.get_user(session.user_id)

	  	return failure(:invalid_move) if move != "rock" || move != "paper" || move != "scissors"
	  	# return failure(:no_guest_id) if guest_id != users.find {|user_id| user_id == guest_id}
  		
  		play = RPS.db.play(match_id, move, session_key)

  		success :play => play
  	end
  end
end
