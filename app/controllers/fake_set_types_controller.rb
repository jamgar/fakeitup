class FakeSetTypesController < ApplicationController
  before_action :set_fake_set

  def new
  end

  def destroy
  end

  private

  def set_fake_set 
    @fake_set = FakeSet.new(fake_set_types: [FakeSetType.new])
  end
end
