class SearchLog < ApplicationRecord
  validates :searchword,
    length: {
      minimum: 1, maximum: 20
    }
end
