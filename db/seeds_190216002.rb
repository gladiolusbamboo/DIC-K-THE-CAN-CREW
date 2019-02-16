cd = Cd.find_by(name: 'ULTRAP');
if cd
  cd.img_name = 'ultrap'
  cd.save
else
  p '見つからない -> ' + name
end
