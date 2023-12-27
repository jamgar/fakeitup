module ApplicationHelper
  require 'csv'

  def get_fake_json(fake_set)
    arr = []
    if fake_set.fake_set_types.any?
      (0..10).each do |x|
        set_hash = fake_set.fake_set_types.each_with_object({}) do |set, hsh|
          hsh[set.type_generator] = "Faker::#{set.parent}".camelize.constantize.send(set.type_generator)
        end
        arr << set_hash
      end
    end
    # arr.to_json
    JSON.pretty_generate(arr)
  end

  def get_fake_csv(fake_set) 
    if fake_set.fake_set_types.any?
      headers = fake_set.fake_set_types.pluck(:type_generator)
      CSV.generate do |csv|
        csv << headers
        (0..10).each do |x|
          values = []
        fake_set.fake_set_types.each do |set|
          values << "Faker::#{set.parent}".camelize.constantize.send(set.type_generator)
        end
        csv << values 
        end
      end
    end
  end
end
