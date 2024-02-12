class SupportsController < ApplicationController

  def show
    @support = Support.new
  end

  def mailform
    @support = Support.new
    render :layout => false
  end

  def send_mail
    @support = Support.new(get_params)
    if @support.save
      NotifierMailer.new_account(params[:support][:email]).deliver_now
      flash[:notice] = 'Your message was successfully delivered.'
      redirect_back_or_to aboutus_url
    else
      render :mailform, :layout => false
    end
  end
private
  def get_params
    params.require(:support).permit(:name, :email, :subject, :description, :website, :mobile, :games, :api, :design, :seo, :hosting, :consulting, :job, :other)
  end
end
