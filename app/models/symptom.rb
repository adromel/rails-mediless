class Symptom < ApplicationRecord
  has_many :oil_treatments
  has_many :essential_oils, through: :oil_treatments

  has_many :acupoint_treatments
  has_many :acupoints, through: :acupoint_treatments

  include PgSearch::Model
  pg_search_scope(
    :pg_search,
    against: [:name],
    using: {
      tsearch: { prefix: true },
    },
    ignoring: :accents,
  )
end
