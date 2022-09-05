class Acupoint < ApplicationRecord
  has_many :acupoint_treatments
  has_many :symptoms, through: :acupoint_treatments
  has_many :list_elements, as: :listable

  def photo
    nil
  end
end
