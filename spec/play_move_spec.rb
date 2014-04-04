require 'spec_helper'

module RPS
	describe PlayMove do
		before do
			@db = RPS.db
			
			@gilbert = RPS.db.sign_up("Gilbert", "superchill", "peanuts")
			@gene = RPS.db.sign_up("Gene", "superchiller", "peanuts")
			@gilbert_session = RPS.db.sign_in("superchill", "peanuts")
			@gene_session = RPS.db.sign_in("superchiller", "peanuts")
			invite = RPS.db.add_invitation(@gilbert_session.session_key, @gene.id)
			RPS.db.accept_invite(invite.id, @gilbert_session.session_key, @gene.id)
		end

		xit "allows a user to play rock, paper or scissors" do
			result = subject.run(:match_id => "Brady", :username => "superchill420", :password => "peanuts")
			expect(result.success?).to eq(true)
			expect(result.sign_up).to be_a(User)
		end
	end
end