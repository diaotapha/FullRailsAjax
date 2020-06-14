class Panier < ApplicationRecord
    has_many :produits , dependent: :destroy
end
