git push heroku master
call heroku pg:backups capture
call heroku run rails db:seed
