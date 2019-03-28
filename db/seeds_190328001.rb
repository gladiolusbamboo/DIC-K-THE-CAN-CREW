cd = Cd.find_by(name: 'Boys&Gentlemen');
if cd
  cd.img_name = 'boysgentleman'
  cd.save
else
  p '見つからない -> ' + name
end
