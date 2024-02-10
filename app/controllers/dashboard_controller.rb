class DashboardController < ApplicationController
  #before_action :require_user
  before_action :get_user, except: [:destroy_photo, :destroy_demo]
  before_action :get_movie, only: [:show]
  protect_from_forgery only: [:create_photo]
  
  def show    
    @tags = User.tag_counts_on(:tags)
    #@user = current_user
    @post = Post.new
    if @user
      @posts = @user.posts.all.paginate(:page => params[:page], :per_page => 5)      
    else
      redirect_to root_url
    end
  end

  def new_photo
    #@user = current_user
    render :layout => false
  end

  def paragraphe
    #@user = current_user
    #render :layout => false
  end

  def create_photo
    #User.update(@user.id, user_photo_params)
    respond_to do |format|
      if current_user.update(user_photo_params)
        #photo_file_name: params[:user][:photo].original_filename)
        # puts @user.photo_file_name.nil?
        #photo_file_name: params[:user][:photo].original_filename, photo_content_type: params[:user][:photo].content_type)#, photo_file_size: params[:user][:photo].original_file_name#user_avatar_params)
        #Rails.logger.debug("my content_type :  #{user_photo_params}")
        #Rails.logger.debug("my object :  #{params[:user][:photo].content_type}")
        #add_column :users, :photo_file_name, :string
        #add_column :users, :photo_content_type, :string
        #add_column :users, :photo_file_size, :integer
        #add_column :users, :photo_updated_at, :datetime
        #if @user.update(user_avatar_params)
        #photo_file_name: params[:user][:original_filename], photo_content_type: params[:user][:content_type])
        flash[:notice] = "Your picture was successfully created"
        format.json {render :json => {response: 'success', data: "parent.location.href = \"#{dashboard_path}\";" }}
      #redirect_to dashboard_url
      else
        flash[:notice] = "We accept JPG - JPEG - PNG - BMP format only!"
        format.js {render js: "parent.location.href = \"#{dashboard_path}\";"}
        #redirect_to dashboard_url
      end
    end
  end 
  
  def new_demo
    #@user = current_user

    render :layout => false
  end

  def create_demo
    #@user = current_user
    if @user.update(user_demo_params)#.update_attributes(params[:user])
     flash[:notice] = "Your movie was successfully created"
     redirect_to dashboard_url
     else
     flash[:notice] = "We allow FLV format only!"
       redirect_to dashboard_url
     end
  end 
  
  def edit
    #@user = current_user
  end

  def destroy_photo    
    @user = current_user.photo.destroy

    current_user.update_attribute(:photo_file_name, nil)
    current_user.update_attribute(:photo_content_type, nil)
    current_user.update_attribute(:photo_file_size, "")
    current_user.update_attribute(:photo_updated_at, "")
    flash[:notice] = "Your picture was successfully deleted"
    redirect_to dashboard_url  
  end
  
  def destroy_demo    
    @user = current_user.demo.destroy

    current_user.update_attribute(:demo_file_name, nil)
    current_user.update_attribute(:demo_content_type, nil)
    current_user.update_attribute(:demo_file_size, "")
    current_user.update_attribute(:demo_updated_at, "")
    flash[:notice] = "Your movie was successfully deleted"
    redirect_back_or_to dashboard_url  
  end
  
private
  def get_user
     @user = current_user
  end
  def get_movie
     @movie = Movie.all
  end
  def user_photo_params
    #params.require(:user).permit(:photo)
    params.require(:user).permit(:photo)
  end
  
  def user_demo_params
    params.require(:user).permit(:demo)
  end
end
