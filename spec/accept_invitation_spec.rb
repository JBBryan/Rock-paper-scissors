require 'spec_helper'

module RPS
	describe AcceptInvitation do
		before do
			@db = RPS.db

			@gilbert = RPS.db.sign_up("Gilbert", "superchill", "peanuts")
			@gene = RPS.db.sign_up("Gene", "superchiller", "peanuts")
			
			@gilbert_session = RPS.db.sign_in("superchill", "peanuts")
			@gene_session = RPS.db.sign_in("superchiller", "peanuts")

			@new_invite = RPS.db.add_invitation(@gilbert_session.session_key, @gene_session.session_key)
		end

		xit "allows the guest to accept the invitation" do
			result = subject.run(:host_id => @gilbert.id, :guest_id => @gene.id, :invite_id => @new_invite.id)
			expect(result.success?).to eq(true)
			expect(result.invite.status).to eq("accepted")
		end

		xit "errors when an argument is invalid" do
			result = subject.run(:host_id => 80085, :guest_id => @gene.id, :invite_id => @new_invite.id)
			expect(result.error).to eq(:no_host_id)
			
			result = subject.run(:host_id => @gilbert.id, :guest_id => 80085, :invite_id => @new_invite.id)
			expect(result.error).to eq(:no_guest_id)
			
			result = subject.run(:host_id => @gilbert.id, :guest_id => @gene.id, :invite_id => 80085)
			expect(result.error).to eq(:invalid_invite_id)
			
		end
	end
end