# USAGE:
# $ bundle exec ruby reset-db.rb
#
# You can also specify a database:
# $ bundle exec ruby reset_db.rb my-app.db
require "sqlite3"

db_name = ARGV[0] || "rps_test.db"
sqlite = SQLite3::Database.new(db_name)

puts "Destroying #{db_name}..."
sqlite.execute %q{DROP TABLE IF EXISTS users}

puts "Creating tables..."
sqlite.execute %q{
  CREATE TABLE users (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT     NOT NULL,
    username        TEXT     NOT NULL,
    password        TEXT     NOT NULL
  );
}

puts "Database Schema:\n\n"
puts `echo .schema | sqlite3 #{db_name}`
