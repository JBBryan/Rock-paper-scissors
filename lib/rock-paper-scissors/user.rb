class RPS::User

  attr_reader :name, :id
  attr_accessor :win_count

  @@user_id = 0

  def initialize(name)
    @name = name
    @@user_id += 1
    @id = @@user_id
    @win_count = 0
  end

end
