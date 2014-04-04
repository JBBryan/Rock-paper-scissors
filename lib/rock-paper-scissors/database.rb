module RPS
  # def self.db
  #   @__db_instance ||= Database.new

  #   if @__db_instance.nil?
  #     @__db_instance = Database.new
  #   end
  #   return @__db_instance
  # end

  def self.db
    @__db_instance ||= DB.new(@app_db_name)
  end

  # This allows us to set our database name in both our
  # spec_helper.rb and also our client code.
  # You MUST set this before the **first time** you call your singleton getter.
  def self.db_name=(db_name)
    @app_db_name = db_name
  end

  class DB

    attr_reader :users, :matches, :games, :invites, :sessions

    def initialize(db_name)
      @sqlite = SQLite3::Database.new(db_name)
      @users = {}
      @matches = {}
      @games = {}
      @invites = {}
      @sessions = {}
    end

    ###############################################
    ################## USERS ######################
    ###############################################
    
    def add_user(name)
      user = User.new(name)
      @users[user.id] = user
      return user

      # user = @sqlite.execute("INSERT INTO users (name) VALUES (?) ")
    end

    def get_user(user_id)
      return @users[user_id]
    end

    ###############################################
    ################## MATCH ######################
    ###############################################
    def add_match(user1_id, user2_id)
      match = Match.new(user1_id, user2_id)
      @matches[match.id] = match
      return match
    end

    def get_match(match_id)
      return @matches[match_id]
    end

    ###############################################
    ############### INVITATIONS ###################
    ###############################################
    def add_invitation(host_session_key, guest_id)
      host_id = get_user_id_by_session(host_session_key)

      invite = Invitation.new(host_id, guest_id)
      @invites[invite.id] = invite
      return invite
    end

    def get_user_id_by_session(session_key)
      @sessions[session_key].user_id
    end

    def get_invite(invite_id)
      return @invites[invite_id]
    end

    def accept_invite(invite_id, host_id, guest_id)
      
      invite = RPS.db.get_invite(invite_id)
      invite.status = "accepted"
      match = RPS.db.add_match(host_id, guest_id)
      game = RPS.db.add_game(match.id)
      return invite
    end

    ###############################################
    ################# SESSION #####################
    ###############################################

    def start_session(user_id)
      session = Session.new(user_id)
      session_key = session.session_key
      @sessions[session_key] = session
      return session
    end

    def get_session(session_key)
      session = @sessions[session_key]
    end

    
    def get_user_by_session(session_key)
      user_id = @sessions[session_key].user_id
      get_user(user_id)
    end

    ###############################################
    ################### GAME ######################
    ###############################################

    def add_game(match_id)
      new_game = Game.new(match_id)
      @games[new_game.id] = new_game
    end

    def get_game(game_id)
      return @games[game_id]
    end

    ###############################################
    ################## PLAY #######################
    ###############################################

    def play(match_id, move, session_key)
      match = RPS.db.get_match(match_id)
      games = RPS.db.games.values.select {|game| game.match_id == match_id}
      game = games.find{ |game| game.winner_id == nil }
      user_id = get_user_id_by_session(session_key)
      
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
          game.winner_id = match.player1_id
          match.p1_win_counter += 1
        elsif game.p1_move == "rock" && game.p2_move == "paper"
          game.winner_id = match.player2_id
          match.p2_win_counter += 1
        elsif game.p1_move == "paper" && game.p2_move == "scissors"
          game.winner_id = match.player2_id
          match.p2_win_counter += 1
        elsif game.p1_move == "paper" && game.p2_move == "rock"
          game.winner_id = match.player1_id
          match.p1_win_counter += 1
        elsif game.p1_move == "scissors" && game.p2_move == "paper"
          game.winner_id = match.player1_id
          match.p1_win_counter += 1
        else
          game.winner_id = match.player2_id
          match.p2_win_counter += 1
        end #end if /else game logic
      end #end if game.p1_move && game.p2_move != nil
    end #end play

    ###############################################
    ################# SIGN UP #####################
    ################# SIGN IN #####################
    ###############################################

    def sign_up(name, username, password)
      user = RPS.db.add_user(name)
      user.username = username
      user.password = password
      return user
    end

    def sign_in(username, password)
      user = RPS.db.users.values.find {|user| user.username == username}
      session = RPS.db.start_session(user.id)
      return session
    end

    ##############################
    ## SQL Database Interaction ##
    ##############################

    def clear_all_records
      @sqlite.execute("DELETE FROM users")
    end

  end # end class Database
end # end module RPS