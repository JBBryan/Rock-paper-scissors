module RPS
  def self.db
    @__db_instance ||= Database.new

    if @__db_instance.nil?
      @__db_instance = Database.new
    end
    return @__db_instance
  end

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

      def play(match_id, move, user_id)
        match = RPS.db.get_match(match_id)
        games = RPS.db.games.values.select {|game| game.match_id == match_id}

        game = games.find{ |game| game.winner_id == nil }

        if user_id == match.player1_id
          game.p1_move = move
        else
          game.p2_move = move
        end

        if game.p1_move != nil && game.p2_move != nil
          if game.p1_move == game.p2_move
            game.winner_id = 0
            match.tie_counter += 1
          elsif game.p1_move == "rock" && game.p2_move == "scissors"
            game.winner_id = 1
            match.p1_win_counter += 1
          elsif game.p1_move == "rock" && game.p2_move == "paper"
            game.winner_id = 2
            match.p2_win_counter += 1
          elsif game.p1_move == "paper" && game.p2_move == "scissors"
            game.winner_id = 2
            match.p2_win_counter += 1
          elsif game.p1_move == "paper" && game.p2_move == "rock"
            game.winner_id = 1
            match.p1_win_counter += 1
          elsif game.p1_move == "scissors" && game.p2_move == "paper"
            game.winner_id = 1
            match.p1_win_counter += 1
          else
            game.winner_id = 2
            match.p2_win_counter += 1
          end #end if /else game logic
        end #end if game.p1_move && game.p2_move != nil
      end #end play
    end
  end
end
