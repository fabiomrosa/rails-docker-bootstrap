# Rails Docker Bootstrap

## Rails Application
```
docker-compose run --no-deps app rails new . --force --database=postgresql
```

## Rails Api
```
docker-compose run --no-deps app rails new . --api --force --database=postgresql
```

#### Add database configuration into: `/config/database.yml`
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

## How to create the database
```
docker-compose exec web rails db:create
```
