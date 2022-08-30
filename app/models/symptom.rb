class Symptom < ApplicationRecord
  has_many :oil_treatments
  has_many :essential_oils, through: :oil_treatments

  has_many :acupoint_treatments
  has_many :acupoints, through: :acupoint_treatments
end
