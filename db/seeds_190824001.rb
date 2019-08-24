cd = Cd.find_by(name: '地球人?');
if cd
  cd.img_name = 'chikyuujin'
  cd.save
else
  p '見つからない -> ' + name
end
