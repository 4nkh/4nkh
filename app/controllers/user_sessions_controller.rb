class UserSessionsController < ApplicationController
  #before_action :get_tag, :only => [:new]
  
  def new
    #@users = User.all
    @user_session = UserSession.new
    #@user = User.new
    render :layout => false
  end

  def create_backup
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
  
  def create
      #@user_session = UserSession.new(params[:user_session])
      #@user_session = UserSession.new(user_session_params.to_h)
      @user_session = User.find_by(login: params[:user_session][:login])
      #puts params[:user_session]
      respond_to do |format|
        if @user_session && @user_session.authenticate(params[:user_session][:password])
          session[:user_id] = @user_session.id
          #redirect_to root_path
          
          #@user_session = UserSession.new(params_session.to_h)
          #puts @user_session
          #@user_session.save
          #redirect_to dashboard_url
          flash[:notice] = "You have logged in successfully."
          format.js {render js: "parent.location.href = \"#{dashboard_path}\";"} 
        else
          #flash[:alert] = "Login failed"
          #redirect_to new_user_session_path
        
          flash[:error] = "You made a mistake, try again"
          format.js { render text: "window.location=\"#{request.referer ? request.referer : '/'}\";"}
          #render :js => "window.location=\"#{request.referer ? request.referer : '/'}\";"
          #redirect_to :back
        end
      end
    end

  def destroy
    session[:user_id] = nil
    #current_user_session.destroy
    redirect_to root_url
  end
  
  private
    #def get_tag
    #  @tags = User.tag_counts_on([:tags], :order => 'created_at ASC')
    #  @tagdir = User.by_tag('directors')
    #  @tagres = User.by_tag('realisators')
    #  @tagcam = User.by_tag('cameramans')
    #  @taglight = User.by_tag('lights_technicians')
    #  @tagsnd = User.by_tag('sounds_takers')     
    #end
    
    def params_session
      params.require(:user_session).permit(:login)
    end
end

