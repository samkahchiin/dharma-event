RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    # NOTE: Cleaning the data by rollback
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, js: true) do
    # NOTE: Cleaning the data by empty the table
    # Other options: transaction, deletion
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
