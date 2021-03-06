# Rails Docker Bootstrap

## Getting Started
After cloning this repo into your workspace, duplicate `.env.example` renaming the file to `.env`

## Generating Rails App

### Rails App
```
docker-compose run --no-deps app rails new . --force --database=postgresql
```

### Rails Api
```
docker-compose run --no-deps app rails new . --api --force --database=postgresql
```

### Replace the contents of `config/database.yml` with the following:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV['DATABASE_HOST'] %>
  port: <%= ENV['DATABASE_PORT'] || '5432' %>
  database: <%= ENV['DATABASE_NAME'] %>
  username: <%= ENV['DATABASE_USER'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
```

### Add with the following code into `config/environments/development.rb`:
```
config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
  :address => ENV['MAILER_ADDRESS'],
  :port => ENV['MAILER_PORT'],
  :user_name => ENV['MAILER_USER'],
  :password => ENV['MAILER_PASSWORD'],
  :authentication => :plain,
  :enable_starttls_auto => true,
}
```

### Replace the contents of `config/environments/development.rb` with the following, to allow files updating using Docker:
```
config.file_watcher = ActiveSupport::FileUpdateChecker
```

## Building and running the application
```
docker-compose up --build
```

## Creating the database
```
docker-compose exec app rails db:create
```

## Useful commands

Rails console
```
docker-compose exec app rails console
```

Rails dbconsole
```
docker-compose exec app rails dbconsole
```

Rails generate
```
docker-compose exec app rails generate
```

Rails migrate
```
docker-compose exec app rails db:migrate
```
