class AdminController < ApplicationController
  before_action :require_admin

private
  def require_admin
    require_user
    unless !!current_user.is_admin
      redirect_to root_url
    end
  end
end

