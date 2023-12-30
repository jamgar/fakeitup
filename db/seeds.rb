# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

# Seed the TypesList table with the different Faker types
file = JSON.parse(File.read('faker_types.json'))
TypesList.destroy_all
file.each do |key, value| 
  type_list = TypesList.create!(parent: key, published: value["published"])

  value["types"].each do |type|
    TypesGenerator.create!(name: type["name"], arguments: type["arguments"], types_list_id: type_list.id)
  end
end

