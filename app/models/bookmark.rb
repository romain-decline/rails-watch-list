class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, presence: true, uniqueness: { scope: :list_id}
  validates :comment, length: { minimum: 6}

end
