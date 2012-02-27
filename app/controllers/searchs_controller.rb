class SearchsController < ApplicationController
  layout 'search'
  before_filter :get_alphabet, :except => []
  before_filter :get_tag, :except => [:tag_cloud]
  def index
    @posts = Post.all.paginate :page => params[:page], :per_page => Post::PER_PAGE
  end

  def letter
    @posts = Post.starts_with(params[:letter]).paginate :page => params[:page], :per_page => Post::PER_PAGE 
    render 'searchs/show'
  end
 
  def letter_textos
    @posts = Post.by_model('textos').by_tag('visible').starts_with(params[:letter]).paginate :page => params[:page], :per_page => Post::PER_PAGE
    render 'searchs/letter'
  end

  def letter_videos
    @posts = Post.by_model('videos').by_tag('visible').starts_with(params[:letter]).paginate :page => params[:page], :per_page => Post::PER_PAGE
    render 'searchs/letter'
  end

  def letter_links
    @posts = Post.by_model('links').by_tag('visible').starts_with(params[:letter]).paginate :page => params[:page], :per_page => Post::PER_PAGE
    render 'searchs/letter'
  end

  def letter_images
    @posts = Post.by_model('images').by_tag('visible').starts_with(params[:letter]).paginate :page => params[:page], :per_page => Post::PER_PAGE
    render 'searchs/letter'
  end


  def textos
    @posts = Post.by_model('textos').by_tag('visible').paginate :per_page => 5, :page => (params[:page] || 1)
    render 'searchs/index'
  end

  def videos
    @posts = Post.by_model('videos').by_tag('visible').paginate :per_page => 5, :page => (params[:page] || 1)
    render 'searchs/index'
  end

  def links
    @posts = Post.by_model('links').by_tag('visible').paginate :per_page => 5, :page => (params[:page] || 1)
    render 'searchs/index'
  end

  def images
    @posts = Post.by_model('images').by_tag('visible').paginate :per_page => 5, :page => (params[:page] || 1)
    render 'searchs/index'
  end

  def search
   # @posts = Post.tagged_with(params[:search],:on => :tags).paginate(:page => params[:page], :per_page => 5)
    @posts = Post.by_tag('visible').tagged_with(params[:search],:on => :tags).paginate :per_page => 5, :page => (params[:page] || 1)
    render 'searchs/index'
  end

  def research
    @posts = Post.search(params[:research],:on => :posts, :with => {:tag_type => "Visible"}, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => Post::PER_PAGE)
    #@posts = @search.paginate :page => params[:page], :per_page => Post::PER_PAGE
    render 'searchs/show'
  end

  def research_video
    @visible = Post.by_state('Visible')
    @posts = @visible.by_kind('videos').search(params[:research],:on => :posts, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'searchs/show'
  end

  def research_image
    @visible = Post.by_state('Visible')
    @posts = @visible.by_kind('images').search(params[:research],:on => :posts, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'searchs/show'
  end

  def research_link
    @visible = Post.by_state('Visible')
    @posts = @visible.by_kind('links').search(params[:research],:on => :posts, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'searchs/show'
  end

  def research_text
    @visible = Post.by_state('Visible')
    @posts = @visible.by_kind('textos').search(params[:research],:on => :posts, :star => true, :match_mode => :boolean, :page => params[:page], :per_page => 25)
    render 'searchs/show'
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
    @tags = params[:letter] ?
      @tags.letter(params[:letter]) :
    @tags.find(:all)
    render 'searchs/tag_cloud'
  end

private 
  def get_tag
    @tags = Post.tag_counts_on(:tags).paginate(:page => params[:page], :per_page => 30)
  end
  def get_alphabet
    @alphabet = ('A'..'Z').to_a + ('0'..'9').to_a
  end

end
