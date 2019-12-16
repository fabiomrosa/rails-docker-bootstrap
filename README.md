```
docker-compose run web rails new . --api --force --database=postgresql
```

```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: app_development


test:
  <<: *default
  database: app_test
```

```
docker-compose up --build
```

```
docker-compose exec web rails db:create
```
