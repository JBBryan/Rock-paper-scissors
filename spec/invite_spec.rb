require 'spec_helper'

module RPS
	describe "RPS::Invitation" do
		it "exists" do
			invite = Invitation.new(1, 2)
			expect(invite).to be_an(Invitation)
		end

		it "receives a unique invitation ID" do
			invite1 = Invitation.new(1, 2)
			invite2 = Invitation.new(1, 3)

			expect(invite1.id).to_not eq(invite2.id)
		end
	end
end