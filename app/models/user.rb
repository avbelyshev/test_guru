class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def to_s
    full_name = first_name.to_s
    full_name += " #{last_name}" if last_name.to_s.present?
    full_name += " (#{name})" if full_name.to_s.present? && name.to_s.present?
    full_name = name if full_name.to_s.empty?
    full_name = email if full_name.to_s.empty?
    full_name
  end
end
