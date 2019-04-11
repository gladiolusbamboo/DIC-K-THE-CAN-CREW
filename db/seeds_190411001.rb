cd = Cd.find_by(name: '切り札のカード');
if cd
  cd.img_name = 'kirifudanocard'
  cd.save
else
  p '見つからない -> ' + name
end
