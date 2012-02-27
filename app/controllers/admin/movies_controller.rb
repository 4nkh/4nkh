class Admin::MoviesController < AdminController
  def index
    @movies = Movie.find(:all)
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a
    @oneletter = params[:letter]
    @movies = params[:letter] ?
      Movie.letter(params[:letter]).paginate(:page => params[:page], :per_page => 9) :
    Movie.find(:all).paginate(:page => params[:page], :per_page => 9)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to admin_movies_url
    else
      render :edit
    end
  end

  def destroy
   @movie = Movie.destroy(params[:movie_id])
   redirect_to :back
  end 

  def research    
    @movies = Movie.search(params[:research][:q],:on => :movies, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render :layout => 'admin'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attribute(params[:movie])
      redirect_to admin_movie_url(@movie)
    else
      render :edit
    end
  end

end
