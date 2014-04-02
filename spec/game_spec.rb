require 'spec_helper'

module RPS
	describe "RPS::Game" do
		before do
			RPS.db
			RPS.db
			RPS.db
			RPS.db
			RPS.db
		end

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
			new_match = RPS.db.add_match(1,2)
			new_game = Game.new(new_match.id)
			new_game.play("rock")
			expect(new_game.p2_move).to eq(nil)
			new_game.play("rock")
			expect(new_game.p2_move).to eq("rock")
		end

		it "returns a winner after both players move" do
			new_match = RPS.db.add_match(1,2)
			new_game = RPS.db.add_game(new_match.id)
			new_game.play("rock")
			expect(new_game.winner_id).to eq(nil)
			new_game.play("paper")
			expect(new_game.winner_id).to eq(2)

			new_match1 = RPS.db.add_match(1,2)
			new_game1 = Game.new(new_match1.id)
			new_game1.play("paper")
			new_game1.play("scissors")
			expect(new_game1.winner_id).to eq(2)

			new_match2 = RPS.db.add_match(1,2)
			new_game2 = Game.new(new_match2.id)
			new_game2.play("scissors")
			new_game2.play("rock")
			expect(new_game2.winner_id).to eq(2)

			new_match3 = RPS.db.add_match(1,2)
			new_game3 = Game.new(new_match3.id)
			new_game3.play("rock")
			new_game3.play("scissors")
			expect(new_game3.winner_id).to eq(1)

		end

		it "returns '0' as winner_id after a tie game" do
			new_match = RPS.db.add_match(1,2)
			new_game = Game.new(new_match.id)
			new_game.play("rock")
			new_game.play("rock")
			expect(new_game.winner_id).to eq(0)
		end

		it "increments the match 'tie_counter' in case of tie" do
			new_match1 = RPS.db.add_match(1,2)
			new_game1 = Game.new(new_match1.id)
			expect(new_match1.tie_counter).to eq(0)
			new_game1.play("rock")
			new_game1.play("rock")
			expect(new_match1.tie_counter).to eq(1)
		end


		it "should update win counter in the match class." do
			new_match = RPS.db.add_match(1, 2)
			new_game = Game.new(new_match.id)
			new_game.play("rock")
			new_game.play("scissors")
			expect(new_match.p1_win_counter).to eq(1)
		end



	end #end 'describe RPS::Game'
end #end module
