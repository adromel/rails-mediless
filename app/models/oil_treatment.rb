class OilTreatment < ApplicationRecord
  belongs_to :symptom
  belongs_to :essential_oil
end
