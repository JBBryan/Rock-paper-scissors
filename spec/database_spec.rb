require 'spec_helper'

module RPS

  describe "Database" do
    before do
      @db =RPS.db

      @alex = RPS.db.add_user("Alex")
      @bob = RPS.db.add_user("Bob")

      @match = RPS.db.add_match(@alex.id, @bob.id)
      @game = RPS.db.add_game(@match.id)
      @alex_session = RPS.db.start_session(@alex.id)
      @bob_session = RPS.db.start_session(@bob.id)
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
      @gilbert = RPS.db.sign_up("Gilbert", "good_friend", "peanuts")
      @gene = RPS.db.sign_up("Gene", "best_friend", "peanuts")
      @gene = RPS.db.add_user("Gene")
      # @gilbert = RPS.db.add_user("Gilbert")

      @gilbert_session = RPS.db.sign_in("good_friend", "peanuts")
      # @gene_session = RPS.db.sign_in("best_friend", "peanuts")
      invite = RPS.db.add_invitation(@gilbert_session.session_key, @gene.id)

      # binding.pry
      expect(invite).to be_an(Invitation)
      expect(RPS.db.get_invite(invite.id).host_id).to eq(@gilbert.id)
    end

    it "can create a game" do
      user_1 = @db.add_user("Tony")
      user_2 = @db.add_user("Ronak")
      match_1 = @db.add_match(user_1.id, user_2.id)
      game_1 = @db.add_game(match_1.id)
      expect(@db.get_game(game_1.id)).to be_a(Game)
    end

    it "can play a game" do
      play1 = RPS.db.play(@match.id, "rock", @alex_session.session_key)
      play2 = RPS.db.play(@match.id, "paper", @bob_session.session_key)
      expect(@game.winner_id).to eq(@bob.id)
    end
  end
end


