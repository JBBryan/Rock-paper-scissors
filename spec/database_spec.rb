require 'spec_helper'

module RPS

  describe "Database" do
    before do
      @db = Database.new
    end

    it "can create a new user" do
      user_1 = @db.add_user("Brady")
      user_2 = @db.add_user("Tony")
      user_3 = @db.add_user("Ronak")
      expect(@db.get_user(user_1.id).name).to eq("Brady")
      expect(@db.get_user(user_3.id).name).to eq("Ronak")
      expect(@db.get_user(user_2.id).name).to eq("Tony")
    end

    it "can create a match" do
      user_1 = @db.add_user("Tony")
      user_2 = @db.add_user("Ronak")
      match_1 = @db.add_match(user_1.id, user_2.id)
      expect(@db.get_match(match_1.id)).to be_a(Match)
    end

    it "can create an invitation" do
      user_1 = @db.add_user("Brady")
      user_2 = @db.add_user("Tony")
      invite = @db.add_invitation(user_1.id, user_2.id)
      expect(@db.get_invite(invite.id)).to be_a(Invitation)
      expect(@db.get_invite(invite.id).host_id).to eq(user_1.id)
    end

    it "can create a game" do
      user_1 = @db.add_user("Tony")
      user_2 = @db.add_user("Ronak")
      match_1 = @db.add_match(user_1.id, user_2.id)
      game_1 = @db.add_game(match_1.id)
      expect(@db.get_game(game_1.id)).to be_a(Game)
    end

    it "can declare a game winner" do
    end

    it "can declare a match winner" do
    end


  end
end


