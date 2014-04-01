module RPS
  class Database

    attr_reader :users, :matches, :games, :invites
    
    def initialize
      @users = {}
      @matches = {}
      @games = {}
      @invites = {}

      def add_user(name)
        user = User.new(name)
        @users[user.id] = user
        return user
      end

      def get_user(user_id)
        return @users[user_id]
      end

      def add_match(user1_id, user2_id)
        match = Match.new(user1_id, user2_id)
        @matches[match.id] = match
        return match
      end

      def get_match(match_id)
        return @matches[match_id]
      end

      def add_invitation(host_id, guest_id)
        invite = Invitation.new(host_id, guest_id)
        @invites[invite.id] = invite
        return invite
      end

      def get_invite(invite_id)
        return @invites[invite_id]
      end

      def add_game(match_id)
        new_game = Game.new(match_id)
        @games[new_game.id] = new_game
      end

      def get_game(game_id)
        return @games[game_id]
      end

      def self.db
        @__db_instance ||= Database.new
      end
    end
  end
end
