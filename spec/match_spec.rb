require 'spec_helper'

module RPS

  describe 'match' do
    before do
      RPS::Match.class_variable_set :@@match_id, 15

      p1 = RPS::User.new('Zues')
      p2 = RPS::User.new('Hades')
      match = RPS::Match.new(p1, p2)
    end

    it 'exist' do
      expect(RPS::Match).to be_a(Class)
    end

    it 'has a id' do
      expect(match.id).to be(16)
    end

    it 'has players' do
      expect(match.player1.name).to eq('Zues')
      expect(match.player2.name).to eq('Hades')
    end

    it 'has a win counter' do
      expect(match.p1_win_counter).to eq(0)
      expect(match.p2_win_counter).to eq(0)
    end

  end

end
