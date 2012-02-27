class Admin::PostsController < AdminController
   before_filter :require_user, :only => [:index,:new,:create, :edit, :update]  

  def self.for_type(name)
    define_method(:post_type) { name }
  end

  def index
    @posts = Post.find(:all)
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a
    @oneletter = params[:letter]
    @posts = params[:letter] ? 
      Post.letter(params[:letter]).paginate(:page => params[:page], :per_page => 9) :
    Post.find(:all).paginate(:page => params[:page], :per_page => 9)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def search
   # @posts = Post.tagged_with(params[:search],:on => :tags).paginate(:page => params[:page], :per_page => 5)
     @posts = Post.by_tag('visible').tagged_with(params[:search],:on => :tags).paginate :per_page => 5, :page => (params[:tags_page] || 1), :order => 'created_at DESC'

    render 'posts/index'
  end

  def research   
    @posts = Post.search(params[:research][:q],:on => :posts, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'admin/posts/results'
  end


  def edit  
    @post = Post.find(params[:id])
   #render :layout => false
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = "The post was successfully updated"
      redirect_to admin_post_url(@post.id)
    else
      flash[:notice] = "You probably did a mistake!"
      redirect_to '/admin/posts'
    end
  end

  def destroy
    @post = Post.destroy(params[:post_id])
    flash[:notice] = "The post was successfully deleted"
    redirect_to '/admin/posts'
  end

private
   #either we set the type from another typecontroller or we use the default
   def post_type
     :textos
   end
end
