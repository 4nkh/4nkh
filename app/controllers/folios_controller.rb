class FoliosController < ApplicationController
  before_filter :require_user, :except => [:index,:show]
  before_filter :get_folio, :only => [:destroy, :destroy_picture]
  def index
    @folio = Folio.find(:all).paginate(:page => params[:page], :per_page => 14)
    respond_to do |format|
      format.html   # renders index.html.erb
      format.iphone# renders index.iphone.erb
    end
  end

  def show
    @folio = Folio.find(params[:id])
    @folios = Folio.find(:all)
    respond_to do |format|
      format.html
      format.iphone { render :layout => 'admin' }
    end
  end

  def position
    @folio = Folio.all
    respond_to do |format|
      format.html   # renders index.html.erb
      format.iphone# renders index.iphone.erb
    end
  end
  
  def new
    @folio = Folio.new
    render :layout => false
  end
  
  def update
     @folio = Folio.find(params[:id])

    if @folio.update_attributes(params[:folio])      
      flash[:notice] = "Layout was successfully updated."
      #expire_page :action => :show
      redirect_to "/folios"
    else
     flash[:notice] = "You made a mistake.*CARFEFUL* (max lenght & required field)" 
     redirect_to :back
    end
  end
  
  def create
    
    @folio = current_user.folios.build(params[:folio])
    
     if @folio.save
       redirect_to "/folios"
       flash[:notice] = "Layout successfully created"
     else
       redirect_to dashboard_url
       flash[:notice] = "We accept FLV format of 70mb or less"
     end    
  end
  
  def destroy   
    @folio = @folio.destroy
    flash[:notice] = "layout successfully deleted"
    redirect_to '/positions/folios'
  end
  
  def new_picture
    @folio = Folio.find(params[:id])
    render :layout => false
  end

  def edit
    @folio = Folio.find(params[:id])
    render :layout => false
  end

  def create_picture
    @folio = Folio.find(params[:id])

     if @folio.update_attributes(params[:folio])
     flash[:notice] = "Your picture was successfully created"
       redirect_to :back
     else
       render_to_facebox :back
     end
  end 
  
  def destroy_picture 
    @folios = @folio.picture.destroy

    @folio.update_attribute(:picture_file_name, nil)
    @folio.update_attribute(:picture_content_type, nil)
    @folio.update_attribute(:picture_file_size, "")
    @folio.update_attribute(:picture_updated_at, "")
    flash[:notice] = "Your picture was successfully deleted"
    redirect_to :back   
  end
  
  def prioritize_tasks
   folios = Folio.find(:all)
     folios.each do |folio|
       folio.position = params[:folio].index(folio.id.to_s) + 1
       folio.save
     end 
    render :nothing => true
  end 
  
private
    def get_folio
      @folio = Folio.find_by_id(params[:id])
    end
end
