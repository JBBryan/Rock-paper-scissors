module RPS

	class Invitation
		attr_reader :host_id, :guest_id, :id
		attr_accessor :status
		@@id = 0

		def initialize(host_id, guest_id)
			@host_id = host_id
			@guest_id = guest_id
			@@id += 1
			@id = @@id
			@status = "pending"
		end
	end
end