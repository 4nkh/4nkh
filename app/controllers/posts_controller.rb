class PostsController < ApplicationController
  before_action :require_user, :only => [:index,:new,:create, :edit, :update, :restricted]  

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @tags = Post.tag_counts_on(:tags).paginate(:page => params[:page], :per_page => 30)
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a
    @post = Post.find(params[:id]).paginate(page: params[:page], per_page: 5)
    render :layout => 'search'
  end  

  def restricted
    @posts = Post.where(tag_type: "Restricted").paginate(:page => params[:page], :per_page => 5)
    #@posts = Post.by_tag('Restricted').paginate(:page => params[:page], :per_page => 10)
    render 'posts/index'
  end
  
  def state
    @posts = Post.where(tag_type: "Visible").paginate(page: params[:page], per_page: 5)
    render 'posts/index'
  end

  def visiblefr
    @posts = Post.where(tag_type: "Visible").paginate(page: params[:page], per_page: 5)#.order(created_at: :desc)
    #@posts = Post.page(params[:page]).order(created_at: :asc).where(tag_type: "Visible")
    render 'posts/index'
  end

  def textos
    @posttxt = Post.by_model('textos').by_tag('Visible').paginate :per_page => 5, :page => (params[:texts_page] || 1)
    render 'posts/index'
  end

  def videos
    @postvid = Post.by_model('videos').by_tag('Visible').paginate :per_page => 5, :page => (params[:vids_page] || 1)
    render 'posts/index'
  end

  def links
    @postlin = Post.by_model('links').by_tag('Visible').paginate :per_page => 5, :page => (params[:links_page] || 1)
    render 'posts/index'
  end

  def images
    @postima = Post.by_model('images').by_tag('Visible').paginate :per_page => 5, :page => (params[:pics_page] || 1)
    render 'posts/index'
  end

  def search
   # @posts = Post.tagged_with(params[:search],:on => :tags).paginate(:page => params[:page], :per_page => 5)
    @posts = Post.by_tag('Visible').tagged_with(params[:search],:on => :tags).paginate :per_page => 5, :page => (params[:tags_page] || 1)
    render 'posts/index'
  end

  def new
    @post = Post.new
  end
  
  def create
    post_type = params[:post][:model].tableize
    #@post = current_user.send(post_type).build(params[:post])
    
    @post = Post.new(post_params)#(params[:post])
    @post.user_id = current_user.id
    #@post.model = post_type
    @post.recorded_url = @post.fetch_oembed_data(params[:post][:url]) if post_type == "videos"
    
    if @post.save
      #@post.uniqueness_of_event(@post.user_id, @post.id)
      redirect_to dashboard_url
      flash[:notice] = "Your post was successfully created"
    else
      redirect_to dashboard_url
      flash[:notice] = "You probably did a mistake!"
    end
  end

  def edit  
    @post = Post.find(params[:id])
   #render :layout => false
  end

  def update
    @post = Post.find_by_id(params[:id])
    params[:post][:recorded_url] = @post.fetch_oembed_data(params[:post][:url]) if params[:post][:model].tableize == "videos"
    if @post.update(post_params)#(params[:post])
      flash[:notice] = "The post was successfully updated"
      redirect_to dashboard_url
    else
      flash[:notice] = "You probably did a mistake!"
      redirect_to dashboard_url
    end
  end

  def destroy
    @post = Post.destroy(params[:post_id])
    flash[:notice] = "The post was successfully deleted"
    redirect_to dashboard_url
    end
    
private
  def post_params
    params.require(:post).permit(:title, :model, :photo, :url, :body, :tag_type)
  end


end
