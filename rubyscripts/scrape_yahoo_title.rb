# URL�ɃA�N�Z�X���邽�߂̃��C�u�����̓ǂݍ���
require 'open-uri'
# Nokogiri���C�u�����̓ǂݍ���
require 'nokogiri'

# �X�N���C�s���O���URL
url = 'http://www.yahoo.co.jp/'

charset = nil
html = open(url) do |f|
  charset = f.charset # ������ʂ��擾
  f.read # html��ǂݍ���ŕϐ�html�ɓn��
end

# html���p�[�X(���)���ăI�u�W�F�N�g�𐶐�
doc = Nokogiri::HTML.parse(html, nil, charset)

# �^�C�g����\��
p doc.title