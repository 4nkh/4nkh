Ankh::Application.routes.draw do

  get    '/login'                       =>               'user_sessions#new',                         :as => :login
  post   '/create_session'              =>               'user_sessions#create',                      :as => :create_session
  delete '/destroy_session'             =>               'user_sessions#destroy',                     :as => :destroy_session
  
  
#  map.resources :users, :collection => {:prioritize_tasks => :post}
   resources :posts 

#POSTS
  get    '/post/:id'                    =>               'posts#show',                                 :as => :show_post
  post   '/create/post'                 =>               'posts#create',                               :as => :create_post
  get    '/blogger'                     =>               'posts#blogger',                              :as => :blog
  get    '/posts/:id/blogpost'          =>               'posts#edit',                                 :as => :edit_blog
  put    '/posts/:id/blogupd'           =>               'posts#update',                               :as => :update_blog
  get    '/posts/all/Visible'           =>               'posts#state',                                :as => :visible
  get    '/posts/all/Restricted'        =>               'posts#restricted',                           :as => :restricted
  get    '/fr/posts/all/Visible'        =>               'posts#visiblefr',                            :as => :visiblefr
  get    '/all/textos/Visible'          =>               'posts#textos',                               :as => :model_textos
  get    '/all/links/Visible'           =>               'posts#links',                                :as => :model_links
  get    '/all/images/Visible'          =>               'posts#images',                               :as => :model_images
  get    '/all/videos/Visible'          =>               'posts#videos',                               :as => :model_videos
  delete '/posts/destroy/:post_id'      =>               'posts#destroy',                              :as => :post_destroy
 
#SEARCHS
  get  '/directory/video/:letter'       =>               'searchs#letter_videos',                      :as => :directory_video
  get  '/directory/image/:letter'       =>               'searchs#letter_images',                      :as => :directory_image
  get  '/directory/link/:letter'        =>               'searchs#letter_links',                       :as => :directory_link
  get  '/directory/texto/:letter'       =>               'searchs#letter_textos',                      :as => :directory_texto
  get  '/blog/textos'                   =>               'searchs#textos',                             :as => :adv_model_textos
  get  '/blog/links'                    =>               'searchs#links',                              :as => :adv_model_links
  get  '/blog/images'                   =>               'searchs#images',                             :as => :adv_model_images
  get  '/blog/videos'                   =>               'searchs#videos',                             :as => :adv_model_videos
  get  '/tag_cloud'                     =>               'searchs#tag_cloud',                          :as => :tag_cloud
  get  '/posts/results/date/:date'      =>               'searchs#post_date',                          :as => :post_date

  post  '/search/posts'                 =>               'searchs#research',                           :as => :search
  post  '/search/posts/texts'           =>               'searchs#research_text',                      :as => :search_text
  post  '/search/posts/links'           =>               'searchs#research_link',                      :as => :search_link
  post  '/search/posts/images'          =>               'searchs#research_image',                     :as => :search_image
  post  '/search/posts/videos'          =>               'searchs#research_video',                     :as => :search_video
  post  '/search/posts/images'          =>               'searchs#research_image',                     :as => :search_image
  get   '/directory/posts'              =>               'searchs#index',                              :as => :directory_posts_all

  get  '/directory/posts/:letter'       =>               'searchs#letter',                             :as => :directory_posts_letter
  get  '/posts/tagged/:search'          =>               'searchs#search',                             :as => :posts_tagged_with

#  map.resources :links
#  map.resources :videos
#  map.resources :textos  
  
 # map.resources :users, :collection => {:prioritize_tasks => :post}

#CONTENT
  get    '/content/edit/:id'            =>               'contents#edit',                             :as => :edit_content
  put    '/content/update/:id'          =>               'contents#update',                           :as => :update_content

#DASHBOARD
  get    '/dashboard'                   =>               'dashboard#show',                            :as => :dashboard
  get    '/photo/new'                   =>               'dashboard#new_photo',                       :as => :new_photo
  put    '/photo/create'                =>               'dashboard#create_photo',                    :as => :create_photo
  delete '/photo/destroy'               =>               'dashboard#destroy_photo',                   :as => :destroy_photo
  get    '/demo/new'                    =>               'dashboard#new_demo',                        :as => :new_demo
  put    '/demo/create'                 =>               'dashboard#create_demo',                     :as => :create_demo
  delete '/demo/destroy'                =>               'dashboard#destroy_demo',                    :as => :destroy_demo
  get    '/paragraphe/edit'             =>               'dashboard#paragraphe',                      :as => :paragraphe

#MOVIES
  get    '/movies/:id/edit'             =>               'movies#edit',                                :as => :edit_movie
  get    '/positions/movies'            =>               'movies#position',                            :as => :position_movie
  get    '/movies/:id/picture/new'      =>               'movies#new_picture',                         :as => :new_movie_picture
  post   '/movies/:id/picture/create'   =>               'movies#create_picture',                      :as => :picture
  delete '/movies/:id/picture/destroy'  =>               'movies#destroy_picture',                     :as => :remove_picture
  delete '/movies/:id/destroy'          =>               'movies#destroy',                             :as => :destroy_movie
  get    '/movies/:id/:style.:format'   =>               'movies#connect',                             :as => :connect
  get    '/services'                    =>               'movies#index',                               :as => :services
  get    '/fr/ervices'                  =>               'movies#index',                               :as => :servicesfr

#FOLIOS
  get    '/games'                       =>               'folios#index',                               :as => :folios
  get    '/fr/jeux'                     =>               'folios#index',                               :as => :frfolios
  get    '/games/:id/edit'              =>               'folios#edit',                                :as => :edit_folio
  get    '/positions/games'             =>               'folios#position',                            :as => :position_folio
  get    '/games/:id/picture/new'       =>               'folios#new_picture',                         :as => :new_position_folio
  post   '/games/create'                =>               'folios#create',                              :as => :create_folio
  post   '/games/picture/create'        =>               'folios#create_picture',                      :as => :create_folio_picture
  delete '/games/:id/picture/destroy'   =>               'folios#destroy_picture',                     :as => :remove_folio_picture
  delete '/games/destroy/:id'           =>               'folios#destroy',                             :as => :destroy_folio

 #keep below because of the destroy priority!
  resources :movies, :collection => {:prioritize_tasks => :post}
  resources :folios, :collection => {:prioritize_tasks => :post}
  resources :search, :collection => {:search => :get}
  

# map.connect '/movies/:id/:style.:format', :controller => :movies, :action => :download
#USERS
  get    '/user/:id'                    =>               'users#show',                                     :as => :show_user
  get    '/positions/users'             =>               'users#position',                                 :as => :position
  get    '/aboutus'                     =>               'users#index',                                    :as => :aboutus
  get    '/fr/apropos'                  =>               'users#index',                                    :as => :aboutusfr
  get    '/signup'                      =>               'users#new',                                      :as => :signup
  get    '/fr/users/:id'                =>               'users#parafr',                                   :as => :parafr
  get    '/account/edit'                =>               'users#edit',                                     :as => :user_edit
  put    '/account/update/:id'          =>               'users#update',                                   :as => :user_update
  post   '/users/create'                =>               'users#create',                                   :as => :user_create
#USER_SESSIONS
  get    '/login'                       =>               'user_sessions#new',                              :as => :login  
  
#SUPPORT
  get    '/fr/notifier/mailform'        =>               'supports#mailform',                              :as => :mailformfr
  get    '/notifier/mailform'           =>               'supports#mailform',                              :as => :mailform
  get    '/contactus'                   =>               'supports#show',                                  :as => :notifier
  get    '/fr/contact'                  =>               'supports#show',                                  :as => :notifierfr
  get    '/notifier/my_mailer'          =>               'supports#my_mailer',                             :as => :my_mailer
  post   '/send_mail'                   =>               'supports#send_mail',                             :as => :send_mail

#CALENDAR
  get   '/calendars/:id/:year/:month'   =>               'calendar#calendar',                              :as => :post_calendars 
  

#  map.with_options(:controller => :pages, :action => :show) do |page|    
 #   page.news '/news', :page => 'news'
  #  page.contactus '/contactus', :page => 'contactus'        
  #end
  
#FRENCH
  get    '/fr/mobile'                   =>               'french#show',        :page => 'mobile',          :as => :mobile_fr
  get    '/fr/outils'                   =>               'french#tools',       :page => 'tools',           :as => :tools_fr
  get    '/fr/realisations'             =>               'french#realisation', :page => 'realisation',     :as => :realisation_fr
  get    '/fr/accueil'                  =>               'french#index',                                   :as => :accueil
  get    '/fr/seo/plan'                 =>               'french#show',        :page => 'seo',             :as => :seo_fr
  get    '/fr/hosting/plan'             =>               'french#show',        :page => 'hosting',         :as => :hosting_fr
  get    '/fr/business/plan'            =>               'french#show',        :page => 'business',        :as => :business_fr


#PAGES
  get    '/mobile'                      =>               'pages#mobile',                                   :as => :mobile
  get    '/tools'                       =>               'pages#tools',                                    :as => :tools
  get    '/realisations'                =>               'pages#realisation',                              :as => :realisation
  get    '/seo/plan'                    =>               'pages#show',         :page => 'seo',             :as => :seo
  get    '/hosting/plan'                =>               'pages#show',         :page => 'hosting',         :as => :hosting
  get    '/business/plan'               =>               'pages#show',         :page => 'business',        :as => :business
  get    '/environment/nasa'            =>               'pages#show',         :page => 'nase',            :as => :nasa
  get    '/fr/environment/nasa'         =>               'pages#show',         :page => 'nase',            :as => :nasafr
  get    '/environment/capcanaveral'    =>               'pages#show',         :page => 'capcanaveral',    :as => :cap
  get    '/fr/environment/capcanaveral' =>               'pages#show',         :page => 'capcanaveral',    :as => :capfr
  get    '/feeds'                       =>               'pages#feed',                                     :as => :feed, :defaults => { :format => 'atom' }

  root :to => 'pages#index'
    
#ADMINS
#  get    '/'                            =>               'users#index',                                    :as => :connect
  
#    admin.resources :users
#    admin.resources :movies
#    admin.resources :dashboard    
#    admin.resources :posts

#  map.admin_photo_destroy '/admin/photo/destroy', :controller => 'admin/dashboard', :action => :destroy_photo
#  map.admin_demo_destroy '/admin/demo/destroy', :controller => 'admin/dashboard', :action => :destroy_demo
#  map.admin_user_destroy '/admin/users/:user_id', :controller => 'admin/users', :action => :destroy
#  map.admin_movie_destroy '/admin/movies/:movie_id', :controller => 'admin/movies', :action => :destroy
#  map.admin_post_destroy '/admin/posts/:post_id', :controller => 'admin/posts', :action => :destroy
#  map.admin_movie_research '/researching', :controller => 'admin/movies', :action => :research
#  map.admin_post_research '/research/posts', :controller => 'admin/posts', :action => :research
#  map.admin_user_research '/research', :controller => 'admin/users', :action => :research


#  map.connect '*path', :controller => :application, :action => :render_404
end
