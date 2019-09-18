cd = Cd.find_by(name: 'AFTERMIXTAPE');
if cd
  cd.img_name = 'aftermixtape'
  cd.save
else
  p '見つからない -> ' + name
end
