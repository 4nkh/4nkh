class UserSessionsController < ApplicationController
  before_filter :get_tag, :only => [:new]
  
  def new
    #@users = User.all
    @user_session = UserSession.new
    #@user = User.new
    render :layout => false
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
    if @user_session.save 
      flash[:notice] = "You have logged in successfully."
      format.js {render :text => "parent.location.href = \"#{dashboard_path}\";"}  
      #render :js => html_safe!("Shadowbox:close();")
      #redirect_to dashboard_url
    else
      flash[:error] = "You made a mistake, try again"
      format.js {render :text => "window.location=\"#{request.referer ? request.referer : '/'}\";"}
      #render :js => "window.location=\"#{request.referer ? request.referer : '/'}\";"
      #redirect_to :back
      end
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_url
  end
  
  private
    def get_tag
      @tags = User.tag_counts_on([:tags], :order => 'created_at ASC')
      @tagdir = User.by_tag('directors')
      @tagres = User.by_tag('realisators')
      @tagcam = User.by_tag('cameramans')
      @taglight = User.by_tag('lights_technicians')
      @tagsnd = User.by_tag('sounds_takers')     
    end 
end

