require 'spec_helper'

module RPS
  describe SignIn do
    before do
      @db = RPS.db
      @brady = RPS.db.sign_up("Brady", "superchill420", "peanuts")
    end

    it "allows the user signs in" do
      result = subject.run(:name => "Brady", :username => "superchill420", :password => "peanuts")
      expect(result.success?).to eq(true)
    end
    
    it "creates a new session when the user signs in" do
          result = subject.run(:name => "Brady", :username => "superchill420", :password => "peanuts")
          expect(result.success?).to eq(true)
          session = RPS.db.get_session(result.sign_in.session_key)
          expect(session).to be_a(Session)
    end

    it "errors when username does not exist" do
      result = subject.run(:name => "Matthew", :username => "matthewmcconaughey", :password => "alrightx3")
      expect(result.error?).to eq(true)
      expect(result.error).to eq(:username_does_not_exist)
    end

    it "errors when password does not match" do
      result = subject.run(:name => "Brady", :username => "superchill420", :password => "notpeanuts")
      expect(result.error?).to eq(true)
      expect(result.error).to eq(:password_does_not_match)
    end
  end
end