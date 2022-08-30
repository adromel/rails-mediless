class AcupointTreatment < ApplicationRecord
  belongs_to :symptom
  belongs_to :acupoint
end
