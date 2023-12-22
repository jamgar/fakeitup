class FakeSetsController < ApplicationController
  before_action :set_fake_set, only: %i[ show edit update destroy show_json ]
  before_action :set_types_list, only: %i[ new create edit update ]

  def index
    @fake_sets = current_user.fake_sets.all
  end

  def show
  end

  def new
    @fake_set = FakeSet.new(fake_set_types: [FakeSetType.new])
  end

  def create
    @fake_set = FakeSet.new(fake_set_params)
    @fake_set.user = current_user

    respond_to do |format|
      if @fake_set.save
        format.html { redirect_to edit_fake_set_path(@fake_set) }
        flash[:notice] = "Fake set successfully created."
      else
        format.html { render :new, status: :unprocessable_entity } 
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @fake_set.update(fake_set_params)
        format.html { redirect_to edit_fake_set_path(@fake_set) }
        flash[:notice] = "Fake set successfully updated."
      else
        format.html { render :edit, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
    @fake_set.destroy
    redirect_to fake_sets_path, notice: "Fake set successfully deleted."
  end

  def show_json
    # return the json format of the current FakeSet to show on the 
    # fake_set view
    @fake_set.generate_json
  end

  private

  def set_fake_set
    @fake_set = current_user.fake_sets.find(params[:id])
  end

  def set_types_list
    @types_list = TypesList.where(published: true)
  end

  def fake_set_params
    params.require(:fake_set).permit(:name, 
                                     fake_set_types_attributes: [:id, 
                                                                 :parent, 
                                                                 :type_generator,
                                                                 :position, 
                                                                 :_destroy])
  end
end
