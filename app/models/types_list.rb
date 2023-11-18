class TypesList < ApplicationRecord
  serialize :sub_types, coder: JSON
end
