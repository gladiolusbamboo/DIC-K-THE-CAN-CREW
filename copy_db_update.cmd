pg_dump --no-acl --no-owner -h localhost -U postgres dickthecancrew_development > dicthecancrewdb.dump
heroku maintenance:on
heroku pg:reset --confirm dicthecancrew
heroku pg:psql DATABASE_URL < dicthecancrewdb.dump
heroku maintenance:off
