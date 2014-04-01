require 'spec_helper'

module RPS
	describe "RPS::Game" do
		it "exists" do
			new_game = Game.new(1)
			expect(new_game).to be_a(Game)
		end

		it "receives a unique game ID" do
			new_game = Game.new(1)
			newer_game = Game.new(1)

			expect(new_game.id).to_not eq(newer_game.id)
		end

		it "lets user1 throw rock paper or scissors" do
			new_game = Game.new(1)
			new_game.play("rock")
			expect(new_game.p1_move).to eq("rock")
			expect(new_game.p2_move).to eq(nil)

		end

		it "takes user2's move after user1's move has been played" do
			new_game = Game.new(1)
			new_game.play("rock")
			expect(new_game.p2_move).to eq(nil)
			new_game.play("rock")
			expect(new_game.p2_move).to eq("rock")
		end

		it "returns a winner after both players move" do
			new_game = Game.new(1)
			new_game.play("rock")
			expect(new_game.winner_id).to eq(nil)
			new_game.play("paper")
			expect(new_game.winner_id).to eq(2)
		end

		it "returns '0' as winner_id after a tie game" do
			new_game = Game.new(1)
			new_game.play("rock")
			new_game.play("rock")
			expect(new_game.winner_id).to eq(0)
		end


	end #end 'describe RPS::Game'
end #end module
