class TypesList < ApplicationRecord
  serialize :type_generators, coder: JSON
end
