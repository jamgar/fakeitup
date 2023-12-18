class AdminController < ApplicationController
  before_action :admin_only

  def index
  end

  private
  def admin_only
    unless Current.session.user.role == "admin"
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
