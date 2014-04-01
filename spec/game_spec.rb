require 'spec_helper'

module RPS
	describe "RPS::Game" do
		it "exists" do
			new_game = Game.new(1, 2, 1)
			expect(new_game).to be_a(Game)
		end

		it "receives a unique game ID" do
			new_game = Game.new(1, 2, 1)
			newer_game = Game.new(1, 3, 1)

			expect(new_game.id).to_not eq(newer_game.id)
		end
	end #end 'describe RPS::Game'
end #end module