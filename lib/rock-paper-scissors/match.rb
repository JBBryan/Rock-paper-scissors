class RPS::Match

  attr_reader :player1_id, :player2_id, :id
  attr_accessor :p1_win_counter, :p2_win_counter, :tie_counter, :winner

  @@match_id = 0

  def initialize(p1_id, p2_id)
    @player1_id = p1_id
    @player2_id = p2_id
    @@match_id += 1
    @id = @@match_id
    @p1_win_counter = 0
    @p2_win_counter = 0
    @tie_counter = 0
    @winner = nil
  end

  def next_game
    # if @winner = nil
      RPS.db.add_game(@id)
    # end
  end



end
