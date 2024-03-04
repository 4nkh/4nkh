class UsersController < ApplicationController
  #before_action :require_user, :except => [:index,:show,:parafr, :new, :create]
  before_action :get_user, only: [:parafr,:edit,:update,:vc]
  before_action :get_tag, :only => [:new,:show,:parafr]
  #caches_page :show 
  
  def index
    @user = User.all
    @users = @user.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.by_tag('visible').paginate(:per_page => 5, :page => (params[:users_page] || 1), :order => 'created_at DESC')
  end

  def parafr
    @user = User.find(params[:id])
    # if params.has_key?(:id)
    #       @user = User.find_by_id(params[:id])
    #     end
    @posts = @user.posts.by_tag('visible').paginate(:per_page => 5, :page => (params[:users_page] || 1), :order => 'created_at DESC')
    render :layout => 'fr'
  end

  def position
    @user = User.all
  end
  
  def new
    @user = User.new 
    render :layout => false
  end

  def create
    #@user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save  
      flash[:notice] = "Account was successfully created, you are now logged in."
      redirect_to dashboard_url
    else
      flash[:notice] = "Failed to create account"
      #render :js
      redirect_to root_url#dashboard_url
    end
 end

  def edit
   render  :layout => false
  end

  def update
    #@user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params) #(params[:user])      
        flash[:notice] = "Your update has been applied."
        #expire_page :action => :show
        #format.html {redirect_to dashboard_path}
        format.json {render json: "parent.location.href = \"#{dashboard_path}\";", :content_type => 'text/javascript'}
        #format.json {render :json => {response: 'success', data: "parent.location.href = \"#{dashboard_path}\";" }}
      else
        flash[:error] = "You probably made a mistake, *CAREFULL WITH* (max lenght& required field)"
        #format.html {redirect_to dashboard_url}
        format.json {render json:  "window.location=\"#{request.referer ? request.referer : dashboard_path}\";"} 
        #format.json {render :json => {response: 'error', data: "window.location=\"#{request.referer ? request.referer : dashboard_path}\";" }}
        #render :text => 
      end
    end
  end

  def prioritize_tasks
    users = User.find(:all)
    users.each do |user|
      user.position = params[:user].index(user.id.to_s) + 1
      user.save
    end
    render :nothing => true
  end

private
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :email, :password, :password_confirmation, :phone, :location, :dob, :tag_type)
  end

  def get_user
     @user = current_user
  end
  
  def get_tag
    @tags = User.tag_counts_on([:tags], :order => 'created_at ASC')
    @tagdir = User.by_tag('directors')
    @tagres = User.by_tag('realisators')
    @tagcam = User.by_tag('cameramans')
    @taglight = User.by_tag('lights_technicians')
    @tagsnd = User.by_tag('sounds_takers')     
  end 
  def get_movie
   @movie = Movie.all
  end
end
