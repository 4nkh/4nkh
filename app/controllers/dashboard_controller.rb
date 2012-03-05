class DashboardController < ApplicationController
  before_filter :require_user
  before_filter :get_movie, :only => [:show]
  
  def show    
    @tags = User.tag_counts_on(:tags)
    @user = current_user
    @post = Post.new
    @posts = @user.posts.find(:all).paginate(:page => params[:page], :per_page => 5)    
  end

  def new_photo
    @user = current_user
    render :layout => false
  end

  def paragraphe
    @user = current_user
    #render :layout => false
  end

  def create_photo
    @user = current_user

     if @user.update_attributes(params[:user])
     flash[:notice] = "Your picture was successfully created"
     redirect_to dashboard_url
     else
       flash[:notice] = "We accept JPG - JPEG - PNG - BMP format only!"
       redirect_to dashboard_url
     end
  end 
  
  def new_demo
    @user = current_user

    render :layout => false
  end

  def create_demo
    @user = current_user
    if
      @user.update_attributes(params[:user])
     flash[:notice] = "Your movie was successfully created"
     else
     flash[:notice] = "We allow FLV format only!"
       redirect_to dashboard_url
     end
  end 
  
  def edit
    @user = current_user
  end

  def destroy_photo    
    @user = current_user.photo.destroy

    current_user.update_attribute(:photo_file_name, nil)
    current_user.update_attribute(:photo_content_type, nil)
    current_user.update_attribute(:photo_file_size, "")
    current_user.update_attribute(:photo_updated_at, "")
    flash[:notice] = "Your picture was successfully deleted"
    redirect_to :back   
  end
  
  def destroy_demo    
    @user = current_user.demo.destroy

    current_user.update_attribute(:demo_file_name, nil)
    current_user.update_attribute(:demo_content_type, nil)
    current_user.update_attribute(:demo_file_size, "")
    current_user.update_attribute(:demo_updated_at, "")
    flash[:notice] = "Your movie was successfully deleted"
    redirect_to :back   
  end
  
private
  def get_movie
     @movie = Movie.all
  end
end
