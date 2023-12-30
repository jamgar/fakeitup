class TypesGenerator < ApplicationRecord
  serialize :arguments, coder: JSON
  belongs_to :types_list
end
