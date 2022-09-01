class List < ApplicationRecord
  belongs_to :user
  belongs_to :essential_oil, optional: true
  belongs_to :acupoint, optional: true
  belongs_to :listable, polymorphic: true

end
