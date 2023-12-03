module ApplicationHelper
  def get_fake_json(fake_set)
    arr = []
    (0..10).each do |x|
      set_hash = fake_set.fake_set_types.each_with_object({}) do |set, hsh|
        hsh[set.type_generator] = "Faker::#{set.parent}".camelize.constantize.send(set.type_generator)
      end
      arr << set_hash
    end
    arr.to_json
  end
end
