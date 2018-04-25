class SearchLog < ApplicationRecord
  validates :searchword,
    length: {minimum: 2, maximum: 20}
end
