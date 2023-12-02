require "json"
require "faker"

namespace :custom do
  desc "Get the types from the Faker gem"

  task :get_types do
    types = Faker.constants.sort.map(&Faker.method(:const_get)).select { |constant| constant.is_a? Class }
    # File.open("faker_types.txt", "w") do |f|
    #   types.each_with_index do |type, index|
    #     type_name = type.to_s.split("::").last
    #     sub_types = type.singleton_methods(false)
    #     if !sub_types.empty?
    #       f.write "#{type_name}, #{sub_types}\n"
    #     end
    #   end
    # end

    File.open("faker_types.json", "w") do |f|
      data = {}
      progress = ""
      types.each do |type|
        p progress += "#"
        type_name = type.to_s.split("::").last
        sub_types = type.singleton_methods(false)
        if !sub_types.empty?
          data[type_name] = sub_types
        end
      end
      f.write data.to_json
    end

    # NOTE run db:seed to ingest the json
    # NOTE will need to add a 'published' column to indicate if the subtype
    # is shown publicly. Some subtypes require extra settings. Then will
    # need to add a list of what subtypes are 'published' so can set to true
    # during setup of contributers.
  end
end

