require 'spec_helper'

module RPS

  describe 'match' do
    before do
      RPS::Match.class_variable_set :@@match_id, 15

      p1 = RPS::User.new('Zeus')
      p2 = RPS::User.new('Hades')
      @match = RPS::Match.new(p1.id, p2.id)
    end

    it 'exist' do
      expect(RPS::Match).to be_a(Class)
    end

    it 'has an id' do
      expect(@match.id).to eq(16)
    end

    it 'has players' do
      p1 = RPS.db.add_user('Zeus')
      p2 = RPS.db.add_user('Hades')
      @player1_id = RPS.db.get_user(p1.id)
      @player2_id = RPS.db.get_user(p2.id)
    end

    it 'has a win counter' do
      expect(@match.p1_win_counter).to eq(0)
      expect(@match.p2_win_counter).to eq(0)
    end

    # it "can declare a winner" do
    #   p1 = RPS.db.add_user('Zeus')
    #   p2 = RPS.db.add_user('Hades')
    #   @player1_id = p1.id
    #   # @player2_id = RPS.db.get_user(p2.id).id

    #   match = RPS.db.add_match(@player1_id, @player2_id)
    #   game = RPS.add_game(match.id)

    #   RPS.db.play(match.id, "rock", uid)
    #   RPS.db.play(match.id, "paper", uid) #player2 winsmatch.id,
    #   RPS.db.play(match.id, "rock", uid)
    #   RPS.db.play(match.id, "scissors", uid) #player1 wins (1)
    #   RPS.db.play(match.id, "rock", uid)
    #   RPS.db.play(match.id, "scissors", uid) #player1 wins (2RPS.db
    #   RPS.db.play(match.id, "rock", uid)
    #   RPS.db.play(match.id, "scissors", uid) #player1 is match winnner

    #   expect(match.p1_win_counter).to eq(3)
    #   expect(match.winner).to eq(@player1.id)
    #   expect(match.p2_win_counter).to eq(1)

    # end

  end

end
