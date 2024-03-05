# Catbank

Basic prototype to send deposit, keep track of silveuros and send them to other people in the bank system.

## Assumptions

- deposits and transactions are different and further extensions which allow for better use cases of deposits will be required.
- transactions must be done as pairs one for incoming and one for out going
- balance will be checked regularly so it needs to be a separate model
- this is requiring a relational database
- logins and admin sections will added later

## Instructions for installation

- Install ruby `3.3.0`
- Install gems `bundle install`
- Setup and install postgres `16`
- Add database credentials in .env
- - DATABASE_PASSWORD
- - DATABASE_USERNAME
- Run the database creation, migrations to get a fully working database for the application.
- Run rails locally via `rails s`
- Access the application at `http://127.0.0.1:3000/`
- `rspec` to run tests
- `bundle exec sidekiq`
