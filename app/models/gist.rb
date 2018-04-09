class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def gist_hash
    gist_url.last(32)
  end
end
