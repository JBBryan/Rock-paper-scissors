module RPS
	class Game

		attr_reader :id
		attr_accessor :p1_move, :p2_move, :winner_id
		@@id = 0

		def initialize(match_id)
			@match_id = match_id
			@@id +=1
			@id = @@id
			@p1_move = nil
			@p2_move = nil
			@winner_id = nil
		end

		def play(move)
			if @p1_move == nil
				@p1_move = move
			else
				@p2_move = move
			end

			if @p2_move != nil
				if @p1_move == @p2_move
					@winner_id = 0
				elsif @p1_move == "rock" && @p2_move == "scissors"
					@winner_id = 1
				elsif @p1_move == "rock" && @p2_move == "paper"
					@winner_id = 2
				elsif @p1_move == "paper" && @p2_move == "scissors"
					@winner_id = 2
				elsif @p1_move == "paper" && @p2_move == "rock"
					@winner_id = 1
				elsif @p1_move == "scissors" && @p2_move == "paper"
					@winner_id = 1
				else
					@winner_id = 2
				end
			end
		end
	end
end
