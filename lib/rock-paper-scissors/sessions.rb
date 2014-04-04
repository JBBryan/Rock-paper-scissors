module RPS
	class Session
		attr_reader :user_id, :session_key
		@@session_key = 0

		def initialize(user_id)
			@user_id = user_id
			@@session_key += 69
			@session_key = @@session_key
		end
	end
end