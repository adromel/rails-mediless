class EssentialOil < ApplicationRecord
  has_many :oil_treatments
  has_many :symptoms, through: :oil_treatments
  has_many :list_elements, as: :listable
end
