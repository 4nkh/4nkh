class SupportsController < ApplicationController

  def show
    @support = Support.new
  end

  def mailform
    @support = Support.new
    render :layout => false
  end

  def send_mail
    @support = Support.new(params[:support])
    if @support.save
      flash[:notice] = 'Your message was successfully delivered.'
      redirect_to :back
    else
      render :mailform, :layout => false
    end
  end
end
