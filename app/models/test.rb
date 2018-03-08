class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.tests_by_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
