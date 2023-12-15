class TypesListsController < ApplicationController
  def index
    @types_list = TypesList.where(published: true)
    @types_list = @types_list.where('type_generators like ?', "%#{params[:type]}%")
                                .or(@types_list.where('parent like ?', "%#{params[:type]}%"))
    render(partial: 'list', locals: { types_list: @types_list })
  end
end
