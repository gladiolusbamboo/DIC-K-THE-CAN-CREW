pg_dump --no-acl --no-owner -h localhost -U postgres dickthecancrew_development > dicthecancrewdb.dump
call heroku maintenance:on
call heroku pg:reset --confirm dicthecancrew
call heroku pg:psql DATABASE_URL < dicthecancrew.dumpcall heroku maintenance:on
call heroku maintenance:off
