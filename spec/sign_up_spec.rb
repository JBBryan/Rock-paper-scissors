require 'spec_helper'

module RPS
	describe SignUp do
		before do
			@db = RPS.db
		end

		it "creates a new user with username and password" do
			result = subject.run(:name => "Brady", :username => "superchill420", :password => "peanuts")
			expect(result.success?).to eq(true)
			expect(result.sign_up).to be_a(User)
		end

		it "errors when username is already taken" do
			first = subject.run(:name => "Brady", :username => "realslimbrady", :password => "neverforget911")
			second = subject.run(:name => "Brady", :username => "realslimbrady", :password => "peanuts")
			expect(second.error?).to eq(true)
			expect(second.error).to eq(:username_exists)
		end

		it "errors when the password is too short" do
			result = subject.run(:name => "Brade", :username => "whatever", :password => "abc")
			expect(result.error?).to eq(true)
			expect(result.error).to eq(:password_too_short)
		end
		
		it "errors when the password is invalid" do
			result = subject.run(:name => "Brade", :username => "whatever", :password => "whatever")
			expect(result.error?).to eq(true)
			expect(result.error).to eq(:password_not_secure)
		end
	end
end