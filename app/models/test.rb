class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
