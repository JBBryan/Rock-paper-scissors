require 'spec_helper'

module RPS

  describe 'User' do
    before do
      RPS::User.class_variable_set :@@user_id, 10
      @user = RPS::User.new("Brosiedon", "numberonebro", "superchill")
    end

    it 'exist' do
      expect(RPS::User).to be_a(Class)
    end

    it 'has a name' do
      expect(@user.name).to eq('Brosiedon')
    end

    it 'has a unique id' do
      expect(@user.id).to eq(11)
    end

    it 'contains a win counter' do
      expect(@user.win_count).to eq(0)
    end

  end


end
