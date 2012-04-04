class ContentsController < ApplicationController
  before_filter :require_user

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
    flash[:notice] = "You successfuly update your content"
    redirect_to :back   
  end

  def edit
    @content = Content.find(params[:id])
  end
end