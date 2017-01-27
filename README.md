# README

###This implementation is based on project description:  
###http://backend.turing.io/module3/projects/rails_engine


* Rails version: 5.0.1

* System dependencies: This app requires postgresql as a database. All other gem dependencies are listed in the Gemfile and can be downloaded by running `bundle` from your terminal.

* General Configuration: clone down this repo, `bundle` to ensure all the Gemfile dependencies are loaded on your local computer, and then you will need to load, migrate, and seed the database with the CSV files.

* Database Configuration: once you have cloned the repo and bundled for gems, you will have to set up the database on your local machine. To do this, please run the following commands from your terminal in order:
<br>
rake db:create (this will create the two postgresql databases needed to run the project)  
rake db:migrate (this will load all the database tables with the information specified in the migration files)  
rake db:test:prepare (this will ensure that you can run the test specs)  
rake db:import_csvs (this will load all of the info from the CSV files into the database)  

* How to run the test suite: once you have set up the database, you can run the test specs by simply typing `rspec` into the terminal. 

* How to run the test harness: there is a detailed spec harness for this project. It can be cloned down from here: https://github.com/turingschool/rales_engine_spec_harness. Directions to properly install the harness are listed in the readme for that repo. Once you have it installed, simply `cd` into the folder and run `rake` from the terminal.

* How to run the program from your local browser: if you would like to run the program from your browser to see how the API is returning JSON objects, please type `puma` or `rails server` into the terminal and then open up a browser of your choice and type in the following basic URL `localhost:3000/api/v1/merchants`, and the word merchants in the URL can be substituted with any of the files from the database tables (merchants, customers, items, invoices, invoice_items, transactions) to access the main directory for each of those collections in the database. The following extra paths are also available: 

####Database Table Endpoints
Each table in the database has a `find`, `find_all`, and a `random` path, which can be accessed from the URL like this:  
`localhost:3000/api/v1/merchants/find?name=grocery`  
`localhost:3000/api/v1/merchants/find_all?name=store`  
`localhost:3000/api/v1/merchants/random`  
where the parameter following = can be whatever you wish to search for. If the parameter you choose returns nothing, that means nothing in the database matches your query. You can search by `id` on every table, and the other search parameters can be viewed by accessing the file called schema.rb from the db folder. The schema.rb file outlines all of the column headings in the database. It looks like this:  
    `t.integer  "quantity"`  
    `t.integer  "unit_price"`  
    `t.datetime "created_at", null: false`  
    `t.datetime "updated_at", null: false`  
    `t.integer  "item_id"`  
    `t.integer  "invoice_id"`  
where all of the t.___ lines indicate what the datatypes are, and the "unit_price" and such indicate the name of the column heading.
DO NOT change any code in the schema.rb file. This will cause the entire program to fail. 

####Business Intelligence Endpoints  
`localhost:3000//api/v1/merchants/:id/revenue`  
`localhost:3000//api/v1/merchants/:id/revenue?date=x`  
`localhost:3000//api/v1/merchants/most_items?quantity=x`  
`localhost:3000//api/v1/customers/:id/favorite_merchant`  
`localhost:3000//api/v1/items/:id/best_day`  
`localhost:3000//api/v1/items/most_items?quantity=x`  
`localhost:3000//api/v1/merchants/:id/customers_with_pending_invoices`  
`localhost:3000//api/v1/merchants/:id/favorite_customer`  
`localhost:3000//api/v1/items/most_revenue?quantity=x`  
`localhost:3000//api/v1/merchants/revenue?date=x`  
`localhost:3000//api/v1/merchants/most_revenue?quantity=x`  

####Relationship Endpoints Between Tables in the Database
<br>
Merchants  
`localhost:3000/api/v1/merchants/:id/items` returns a collection of items associated with that merchant  
`localhost:3000/api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders  
<br>
Invoices  
`localhost:3000/api/v1/invoices/:id/transactions` returns a collection of associated transactions  
`localhost:3000/api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items  
`localhost:3000/api/v1/invoices/:id/items` returns a collection of associated items  
`localhost:3000/api/v1/invoices/:id/customer` returns the associated customer  
`localhost:3000/api/v1/invoices/:id/merchant` returns the associated merchant    
<br>
Invoice Items  
`localhost:3000/api/v1/invoice_items/:id/invoice` returns the associated invoice  
`localhost:3000/api/v1/invoice_items/:id/item` returns the associated item  
<br>
Items  
`localhost:3000/api/v1/items/:id/invoice_items` returns a collection of associated invoice items  
`localhost:3000/api/v1/items/:id/merchant` returns the associated merchant    
<br>
Transactions  
`localhost:3000/api/v1/transactions/:id/invoice` returns the associated invoice    
<br>
Customers  
`localhost:3000/api/v1/customers/:id/invoices` returns a collection of associated invoices  
`localhost:3000/api/v1/customers/:id/transactions` returns a collection of associated transactions  
