begin
  require 'database_cleaner'
  # require 'database_cleaner/cucumber'

  DatabaseCleaner.clean_with(:deletion) # clean once, now
  DatabaseCleaner.strategy = :truncation
  Cucumber::Rails::Database.javascript_strategy = :deletion

rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

