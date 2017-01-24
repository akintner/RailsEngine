# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  require_relative "db/seeds"
  desc "Import CSV to table"
  task :import_csvs => :environment do
    import_customers_csv
    import_invoice_items_csv
  end
end