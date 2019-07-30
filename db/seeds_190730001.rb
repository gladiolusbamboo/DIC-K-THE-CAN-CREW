cd = Cd.find_by(name: 'だからどうした!');
if cd
  cd.img_name = 'dakaradoushita'
  cd.save
else
  p '見つからない -> ' + name
end
