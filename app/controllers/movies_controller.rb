class MoviesController < ApplicationController
  before_action :require_user, :except => [:index,:show]
  before_action :get_movie, :only => [:destroy,:destroy_picture]
  
  def index
    @movie = Movie.find(:all).paginate(:page => params[:page], :per_page => 14)
    respond_to do |format|
      format.html   #renders index.html.erb
      format.iphone #renders index.iphone.erb
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movies = Movie.find(:all)
    respond_to do |format|
      format.html
      format.iphone { render :layout => 'admin' }
    end
  end

  def position
    @user = User.all
    @movie = Movie.all
    respond_to do |format|
      format.html   # renders index.html.erb
      format.iphone# renders index.iphone.erb
    end
  end
  
  def new
    @movie = Movie.new
    render :layout => false
  end
  
  def update
     @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])      
      flash[:notice] = "Movie was successfully updated."
      redirect_to "/movies/#{@movie.id}"
    else
     flash[:notice] = "You made a mistake.*CARFEFUL* (max lenght & required field)" 
     redirect_to :back
    end
  end
  
  def create
    @movie = current_user.movies.build(params[:movie])
    
     if @movie.save
       redirect_to "/movies/#{@movie.id}"
       flash[:notice] = "Movie successfully created"
     else
       redirect_to dashboard_url
       flash[:notice] = "We accept FLV format of 70mb or less"
     end    
  end
  
  def destroy   
    @movie = @movie.destroy(params[:movie_id])
    flash[:notice] = "Movie successfully deleted"
    redirect_to "/dashboard"
  end
  
  def new_picture
    @movie = Movie.find(params[:id])
    render :layout => false
  end

  def edit
    @movie = Movie.find(params[:id])
    render :layout => false
  end

  def create_picture
    @movie = Movie.find(params[:id])

     if @movie.update_attributes(params[:movie])
     flash[:notice] = "Your picture was successfully created"
       redirect_to :back
     else
       render_to_facebox :back
     end
  end 
  
  def destroy_picture 
    @movies = @movie.picture.destroy

    @movie.update_attribute(:picture_file_name, nil)
    @movie.update_attribute(:picture_content_type, nil)
    @movie.update_attribute(:picture_file_size, "")
    @movie.update_attribute(:picture_updated_at, "")
    flash[:notice] = "Your picture was successfully deleted"
    redirect_to :back   
  end
  
  def download
    require 'mime/types'
    head(:not_found) and return if (movie = Movie.find(params[:id])).nil?
    #head(:forbidden) and return unless track.downloadable?

    path = movie.flv.path
    #head(:bad_request) and return unless File.exist?(path) #&& params[:format].to_s == File.extname(path).gsub(/^\.+/,'')

    send_file_options = {:type => MIME::Types.type_for(path)}
    #send_file_options = {:type => File.mime_type?(path)}
    
    #case SETTINGS['send_file_method']
    #when :apache then send_file_options[:x_sendfile] = true
    #when :nginx then head(:x_accel_redirect => path.gsub(Rails.root,''), :content_type => send_file_options[:type]) and return
    #end

    send_file(path,send_file_options)
  end

  def prioritize_tasks
   movies = Movie.find(:all)
     movies.each do |movie|
       movie.position = params[:movie].index(movie.id.to_s) + 1
       movie.save
     end 
    render :nothing => true
  end 
  
private
    def get_movie
      @movie = Movie.find_by_id(params[:id])
    end
  
end
