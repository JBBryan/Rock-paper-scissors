module RPS
	attr_reader :host_id, :guest_id

	class Invitation
		def initialize(host_id, guest_id)
			@host_id = host_id
			@guest_id = guest_id
		end
	end
end