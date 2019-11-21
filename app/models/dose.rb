class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  # A dose must have a description, a cocktail and an ingredient,
  # and [cocktail, ingredient] pairings should be unique.
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
