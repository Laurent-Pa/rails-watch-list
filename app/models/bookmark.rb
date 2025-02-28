class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # on s'assure qu'il n'y a qu'un seul commentaire par liste et film
  validates :list_id, uniqueness: { scope: [:movie_id] }
end
