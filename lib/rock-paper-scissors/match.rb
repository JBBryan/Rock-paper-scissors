class RPS::Match

  attr_reader :player1, :player2, :id
  attr_accessor :p1_win_counter, :p2_win_counter

  @@match_id = 0

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @@match_id += 1
    @id = @@match_id
    @p1_win_counter = 0
    @p2_win_counter = 0
  end




end
