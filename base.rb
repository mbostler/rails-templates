if yes?("Do you want to use RSpec for testing?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec  
end

if yes?("Do you want to add a 'welcome' controller (index action only)?")
  generate :controller, "welcome", "index"
  generate :rspec_controller, "welcome", "index"
  route "map.root :controller => 'welcome'"
end

git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

run "cp ~/.rails/lib/migration_helpers.rb lib/migration_helpers.rb"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".", :commit => "-m 'initial commit'"
