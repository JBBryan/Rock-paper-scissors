require 'spec_helper'

module RPS
	describe "RPS::Invitation" do
		it "exists" do
			invite = Invitation.new(1, 2)
			expect(invite).to be_an(Invitation)
		end
	end
end