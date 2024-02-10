class FoliosController < ApplicationController
  before_action :require_user, :except => [:index,:show]
  before_action :get_folio, :only => [:destroy, :destroy_picture]
  
  def index
    @folio1 = Folio.find_by(id: 1)
    #puts @folio1.description
    @folio = Folio.all.reorder('position asc').paginate(:page => params[:page], :per_page => 18) #find(:all).paginate(:page => params[:page], :per_page => 18)
    respond_to do |format|
      format.html   # renders index.html.erb
      #format.iphone # renders index.iphone.erb
      format.pdf { render pdf: generate_pdf(@client) }
    end
  end

  def show
    @folio = Folio.find(params[:id])
    @folios = Folio.all.reorder('position asc')
    respond_to do |format|
      format.html
      format.iphone { render :layout => 'admin' }
    end
  end

  def position
    @folios = Folio.all.reorder('position asc')
    respond_to do |format|
      format.html   # renders index.html.erb
      format.iphone# renders index.iphone.erb
    end
  end
  
  def new
    @folio = Folio.new
    #render :layout => "realisation"#false
  end
  
  def update
     @folio = Folio.find(params[:id])

    if @folio.update(params_folio)      
      flash[:notice] = "Games was successfully updated."
      #expire_page :action => :show
      redirect_to folios_url
    else
     flash[:error] = "You made a mistake.*CARFEFUL* (max lenght & required field)" 
     redirect_to edit_folio_url(@folio.id)
    end
  end
  
  def create
    @folio = Folio.new(params_folio)
    @folio.user_id = current_user.id
     if @folio.save
       redirect_to folios_url
       flash[:notice] = "Games successfully created"
     else
       flash[:error] = "Something is missing"
       redirect_to new_folio_url
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
    #render :layout => false
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
   @folios = Folio.all.reorder('position asc')
     @folios.each do |folio|
       folio.position = params[:folio].index(folio.id.to_s) + 1
       folio.save!
     end
     @folios = Folio.all.reorder('position asc')
     render js: "#{(render_to_string partial: "shared/position_folio", locals: { folios: @folios }).gsub(/\n/, '')}"
     #render partial: "shared/position_folio", locals: { folios: @folios }
    #render :json => { :success => true, :partial => "shared/position_folio", locals: { folios: @folios } }
    #respond_to do |format|
    #  format.js {render js: "jQuery('.position_wrapper').html('#{render_to_string partial: "shared/position_folio", locals: { folios: @folios }}');"}
    #end
    #head :ok, content_type: "text/html"
    #render :nothing => true
  end 
  
private
    def get_folio
      @folio = Folio.find_by_id(params[:id])
    end
    
    def params_folio
      params.require(:folio).permit(:name, :url, :description, :picture)
    end
end
