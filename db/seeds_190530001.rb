cd = Cd.find_by(name: '恥じゃない');
if cd
  cd.img_name = 'hajijanai'
  cd.save
else
  p '見つからない -> ' + name
end
