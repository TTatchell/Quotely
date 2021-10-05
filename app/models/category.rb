class Category < ApplicationRecord
    has_many :quotes_categories
    has_many :quotes, through: :quotes_categories
end
