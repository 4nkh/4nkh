class Admin::UsersController < AdminController
  def index    
    @users = User.all
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a
    @oneletter = params[:letter]
    @users = params[:letter] ?
      User.letter(params[:letter]).paginate(:page => params[:page], :per_page => 12) :
    User.find(:all).paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @user = User.find(:all)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_users_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def research   
    @users = User.search(params[:research][:q],:on => :users, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'admin/users/results'
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.destroy(params[:user_id])     
    redirect_to :back 
  end

end
