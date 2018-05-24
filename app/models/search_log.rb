class SearchLog < ApplicationRecord
  has_many :search_log_songs
  has_many :songs, through: :search_log_songs

  # searchwordは1-20文字の範囲
  validates :searchword,
    length: {
      minimum: 1, maximum: 20,
      too_short: '20文字以内のフレーズを入力してください',
      too_long: '20文字以内のフレーズを入力してください'
    },
    format: { 
      with: /\A[\p{hiragana}\p{katakana}ー 　]*\z/, 
      if: :is_ruby_search?,
      message: 'ひらがな、カタカナ以外でのふりがな検索はできません'
    }

    def is_ruby_search?
      searchtype == 'ルビ検索'
    end
  # searchtypeは'表記検索''ルビ検索'のみ許容する
  validates :searchtype,
    inclusion:{ 
      in: ['表記検索', 'ルビ検索'],
      message: 'パラメータが不正です'
    }
end
