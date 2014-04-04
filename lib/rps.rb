require 'sqlite3'
require 'pry-debugger'

module RPS
end

require_relative 'rock-paper-scissors/game.rb'
require_relative 'rock-paper-scissors/invite.rb'
require_relative 'rock-paper-scissors/match.rb'
require_relative 'rock-paper-scissors/user.rb'
require_relative 'rock-paper-scissors/database.rb'
require_relative 'rock-paper-scissors/sessions.rb'
require_relative 'use_case.rb'
require_relative 'rock-paper-scissors/use-cases/create_invitation.rb'
require_relative 'rock-paper-scissors/use-cases/accept_invitation.rb'
require_relative 'rock-paper-scissors/use-cases/sign_up.rb'
require_relative 'rock-paper-scissors/use-cases/sign_in.rb'
require_relative 'rock-paper-scissors/use-cases/play_move.rb'
