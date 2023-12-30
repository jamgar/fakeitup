require "json"
require "faker"

namespace :custom do
  desc "Get the types from the Faker gem"

  task :get_types do
    # TODO: backup the lateest faker_types.json with a timestamp

    types = Faker.constants.sort.map(&Faker.method(:const_get)).select { |constant| constant.is_a? Class }

    File.open("faker_types.json", "w") do |f|
      data = {}
      progress = ""
      types.each do |type|
        p progress += "#"
        type_name = type.to_s.split("::").last
        sub_types = type.singleton_methods(false)
        sub_types_data = []
        if !sub_types.empty? && type_name != "Base"
          sub_types.each do |t|
             sub_types_data << { "name": t, "arguments": [] }
          end

          data[type_name] = { "types": sub_types_data, "published": false }
        end
      end
      f.write data.to_json
    end

    # NEW version
    # {
    #  "Address": 
    #  {
    #   "types": [ 
    #       { "name": "street",
    #         "arguments": [ 
    #         { "label": "from", "data_type": "number"},
    #         { "label": "to", "data_type": "number"},
    #         ] 
    #       },
    #     ],
    #   "published": "false"
    #  }

    # OLD version
    # File.open("faker_types.json", "w") do |f|
    #   data = {}
    #   progress = ""
    #   types.each do |type|
    #     p progress += "#"
    #     type_name = type.to_s.split("::").last
    #     sub_types = type.singleton_methods(false)
    #     if !sub_types.empty? && type_name != "Base"
    #       data[type_name] = { "types": sub_types, "published": false }
    #     end
    #   end
    #   f.write data.to_json
    # {
    #   "Address": 
    #   {
    #     "types": ["street"],
    #     "published": "false"
    #   }
    # }
    #
    # NOTE run db:seed to ingest the json
    # NOTE added a 'published' column to indicate if the subtype
    # is shown publicly. Some subtypes require extra settings. Then will
    # need to add a list of what subtypes are 'published' so can set to true
    # during setup of contributers.
  end
end

