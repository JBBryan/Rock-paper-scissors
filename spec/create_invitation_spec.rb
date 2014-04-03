# require 'spec_helper'

# module RPS
# 	describe CreateInvitation do
# 		before do
# 			@db = RPS.db

# 			@gilbert = RPS.db.add_user("Gilbert")
# 			@gene = RPS.db.add_user("Gene")

# 		end
		
# 		it "creates an invitation" do
# 			result = subject.run(:host_id => @gilbert.id, :guest_id => @gene.id)
# 			expect(result.success?).to eq(true)
# 			expect(result.invite).to be_an(Invitation)
# 		end

# 		it "sets the host and guest ID's based on the arguments" do
# 			result = subject.run(:host_id =>@gilbert.id, :guest_id => @gene.id)
# 			expect(result.success?).to eq(true)
# 			expect(result.invite.host_id).to eq(@gilbert.id)
# 			expect(result.invite.guest_id).to eq(@gene.id)
# 		end

# 		it "errors when a host ID is not valid" do
# 			result = subject.run(:host_id =>69, :guest_id => @gene.id)
# 			expect(result.error).to eq(:no_host_id)
# 		end
# 		it "errors when a guest ID is not valid" do
# 			result = subject.run(:host_id =>@gilbert.id, :guest_id => 80085)
# 			expect(result.error).to eq(:no_guest_id)
# 		end
# 	end
# end