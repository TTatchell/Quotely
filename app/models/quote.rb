# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :quotes_categories
  has_many :categories, through: :quotes_categories

  validates :content, length: { minimum: 10, maximum: 1000 }
  validates :author, presence: true

  scope :published, -> { where(published: true) }

  def category_ids=(arr)
    arr.delete("")
    self.categories = []
    arr.each do |cat_id|
      category = Category.find(cat_id)
      self.categories << category
    end
  end
    
end
