# Rails Docker Bootstrap

## How to build rails application with postgres
```
docker-compose run web rails new . --force --database=postgresql
```

## How to build rails api with postgres
```
docker-compose run web rails new . --api --force --database=postgresql
```

### Add database configuration
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

## How to build and run the application
```
docker-compose up --build
```

## How to create database
```
docker-compose exec web rails db:create
```
