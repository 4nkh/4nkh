class Admin::DemosController < AdminController
  def index
    @demo = Demo.find(:all) 
    @user = User.find(:all)  
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a 
    @demos = params[:letter] ?
      Demo.letter(params[:letter]).paginate(:page => params[:page], :per_page => 10) :
    Demo.find(:all).paginate(:page => params[:page], :per_page => 10 )
  end

  def show
    @demo = Demo.find(params[:id])
  end

  def new
    @demo = Demo.new
  end

  def create
    @demo = Demo.new(params[:demo])

    if @demo.save
      redirect_to admin_demos_url
    else
      render :new
    end
  end

  def research    
    @demos = Demo.search(params[:research][:q],:on => :demos, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render :layout => 'admin'
  end

  def destroy    
    @demo = Demo.destroy(params[:demo_id])     
    redirect_to :back   
  end

  def edit
    @demo = Demo.find(params[:id])
  end

  def update
    @demo = Demo.find(params[:id])

    if @demo.update_attribute(params[:demo])
      redirect_to admin_track_url(@demo)
    else
      render :edit
    end
  end

end
