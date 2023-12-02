module ApplicationHelper
  def show_json_here(fake_set)
    set_hash = fake_set.fake_set_types.each_with_object({}) do |set, hsh|
      hsh[set.type_generator] = "Faker::#{set.parent}".camelize.constantize.send(set.type_generator)
    end
    JSON.pretty_generate(set_hash)
  end
end
