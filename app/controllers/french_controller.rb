class FrenchController < ApplicationController
  layout 'fr'
  
  def index
  end
  
  def realisation
    render "pages/#{params[:page]}", :layout => 'realisationfr'
  end
  
  def tools
    render "pages/#{params[:page]}", :layout => "realisationfr"
  end
  
  def show
    begin
     render "pages/#{params[:page]}"
    rescue
      render_404
    end
  end
   
end
