cd = Cd.find_by(name: 'BY PHAR THE DOPEST');
if cd
  cd.img_name = 'bypharthedopest'
  cd.save
else
  p '見つからない -> ' + name
end
