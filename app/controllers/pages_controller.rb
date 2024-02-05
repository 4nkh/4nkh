class PagesController < ApplicationController
   
  def index
  end
  
  def crop_test
    
  end
  
  def realisation
    render :layout => "realisation"
  end  
  
  def tools
    render :layout => "realisation"
  end  
  
  def feed
    @posts = Post.all.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.atom
    end  
  end
  
  def show
    #begin
     render "pages/#{params[:page]}"
    #rescue
    #  render_404
    #end
  end
  
  def html5test
    if current_user.nil?
      redirect_to root_url
    end
  end
   
end

