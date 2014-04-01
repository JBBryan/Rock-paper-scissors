module RPS
	class Game
		
		attr_reader :id
		attr_accessor :p1_move, :p2_move
		@@id = 0

		def initialize(match_id)
			@match_id = match_id
			@@id +=1
			@id = @@id
			@p1_move = nil
			@p2_move = nil
		end
	end
end