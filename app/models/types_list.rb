class TypesList < ApplicationRecord
  has_many :types_generators, dependent: :destroy
end
