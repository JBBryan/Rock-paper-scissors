# database.rb



  def self.db
    @__db_instance ||= Database.new
  end
