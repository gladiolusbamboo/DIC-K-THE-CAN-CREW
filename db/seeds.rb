cd = Cd.find_by(name: 'ヤバスタ');
if cd
  cd.img_name = 'yabasta'
  cd.save
else
  p '見つからない -> ' + name
end
