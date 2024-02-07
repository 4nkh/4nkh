# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)announce = Forum.create(:name => "Announcement", :description => "Announcements, news and other related bits.")
#require 'faker'

admin = User.create(:login => "admin",:email => "admin@4nkh.ca",:password => "odie1st1267", :password_confirmation => "odie1st1267", :is_admin => true)


# admin = User.create(:login => "MBougie",:email => "mathieub@4nkh.com",:password => "odie1st", :password_confirmation => "odie1st", :is_admin => true)
# user = User.create(:login => "DFabien",:email => "denis@artfox.com",:password => "123denis123", :password_confirmation => "123denis123", :is_admin => false)
# user = User.create(:login => "EMillette",:email => "eric_millette@mamixa.com",:password => "123eric123", :password_confirmation => "123eric123", :is_admin => false)
# user = User.create(:login => "MCote",:email => "melanie_cote@4nkh.com",:password => "123mela123", :password_confirmation => "123mela123", :is_admin => false)
# user = User.create(:login => "MDuval",:email => "billing@4nkh.com",:password => "123merc123", :password_confirmation => "123merc123", :is_admin => false)
# user = User.create(:login => "JValrant",:email => "jonathan_valgrant@4nkh.com",:password => "123jona123", :password_confirmation => "123jona123", :is_admin => false)
# user = User.create(:login => "Slabonte",:email => "sebasien_labonte@4nkh.com",:password => "123seba123", :password_confirmation => "123seba123", :is_admin => false)
# user = User.create(:login => "DSmith",:email => "david_smith@4nkh.com",:password => "123davi123", :password_confirmation => "123davi123", :is_admin => false)
# user = User.create(:login => "Jremero",:email => "john_romero@4nkh.com",:password => "123john123", :password_confirmation => "123john123", :is_admin => false)
# user = User.create(:login => "CCasgrain",:email => "catherine_casgrain@4nkh.com",:password => "123cath123", :password_confirmation => "123cath123", :is_admin => false)
# user = User.create(:login => "MDecaroufel",:email => "martin_decaroufel@4nkh.com",:password => "123mart123", :password_confirmation => "123mart123", :is_admin => false)
# user = User.create(:login => "JPDeblois",:email => "jp_debloisl@4nkh.com",:password => "123jean123", :password_confirmation => "123jean123", :is_admin => false)


#CONTENT
#index
content = Content.create(:par1 => "<p>4nkh development is a company that offers you a range of products and varied solutions for your software and internet needs. We create custom and tailored products to meet your requirements. Our team will build your Internet platform, games or application by adding the required elements to provide an efficient and pleasant experience for your customers. We will realize your project and respect a standard of uncomparable quality.</p><p>Different plans and strategies are offered through several services to meet your needs and ambitions.</p>",
                         :par2 => "<p>Whether to inform people about the evolution of your company, provide a platform for commercial online sales, discussion forums advanced, chat interfaces, management, video conferencing through our listed products or not, we will use or build on your specification. 4nkh development have the solution to meet your goals and implement the desired technological instrument.</p><p>We urge you to take a look at our SEO plans for search engines because it will give you the possibility to reach more hits by maximizing your visibility on the web.</p>",
                         :par3 => "<p>Our hosting, managements, statistics, referrals and many others plans are available to maximize the potential and performance in which you aspire.</p><p>Choose from a wide range of utilities that can be added to your concept. Any technological suggestions and requests can be used, according to your preference and for more flexibility. Whether for mobility or any other type of project.</p><p>We are committed to answering all your questions. For any complementary information, contact us!</p>",
                         :par4 => "<p>4nkh development est une entreprise qui vous offres une gamme de produits et de solutions variées pour vos besoins logiciel et internet. Nous créeons des produits personnalisées adapté et répondant à vos exigences. Notre équipe bâtira votre platforme Internet, de jeux ou d'application en ajoutant les éléments requis pour que vos clients est une expérience efficace et agréable. Avec nous vos projets ce réaliseront et respecteront un standard de qualité inégalé.</p><p>Différent plans et stratégies vous sont offerts au travers plusieurs services pour satisfaire vos besoins et ambitions.</p>",
                         :par5 => "<p>Que ce soit pour informer les gens sur l'évolution de votre entreprise ou pour offrir une platefrome commercial de vente en ligne en passant par des produits tels que des forums de discussion évolués, des interfaces de clavardage, de gestion, de vidéo conférence et biens d'avantages. 4nkh development a la solution pour atteindre vos objectifs et mettre en place l'instrument technologique désiré.</p><p>Nous vous incitons fortement à jeter un coup d'oeil sur nos plans de référencement pour les engins de recherche car ceux-ci maximiseront votre visibilité sur la toile.</p>",
                         :par6 => "<p>Nos plans d'hébergements, de gestions, de statistiques, de référencements ainsi que plusieurs autres sont à votre disposition pour maximiser tout le potentiel et le rendement au quel vous aspirer.</p><p>Choisissez parmis un large éventail d'utilitaires pouvant être ajouté à vos concept. Toute suggestions et requêtes technologique peuvent être utilisé, toujours selon vos préférence et ce pour plus de flexibilité. Que ce soit pour de la mobilité ou tout autre type de projet.</p><p>Nous nous engageons à répondre à toutes vos questions, contactez-nous!</p>"
)
#mobile
content = Content.create(:par1 => "<p>We build from scratch a wide variety of applications, complatibles on most of the main platforms like smartphones and tablet. Indeed the growing demand for mobile applications or tablet wins businesses that can no longer afford to neglect what these tools are now part of our daily activities.Give us a mandate to move you in that environment with either native applications or internet.</p><p></p>",
                         :par2 => "<p>In fact we specialize in software or games developement on Android devices (Google) and Iphone/Ipad (Apple) but we can also work on Blackberry/Playbook (RIM) and phone7 Windows (Microsoft).</p><p>We use technologies that dominate the market, to meet rising standards but also to allow more flexibility to your platform. We will inform you about the differences, limitations and specificity between them.</p>",
                         :par3 => "<p>Members of our company will surprise you with their integrity and their proffessionalismes.</p><p>Meet our experts, ask advice and you will see that your goals are accessible at competitive price.</p><p><div class=\"clear\">&nbsp;</div><div class=\"clear\">&nbsp;</div><a href=\"/notifier/mailform\" class=\"btn-more\" rel=\"shadowbox;width=500;height=600\" title=\"\">soumission</a></p><div class=\"clear\">&nbsp;</div><div class=\"clear\">&nbsp;</div>",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#games
content = Content.create(:par1 => "",
                         :par2 => "",
                         :par3 => "",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#seo
content = Content.create(:par1 => "",
                         :par2 => "",
                         :par3 => "",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#hosting
content = Content.create(:par1 => "",
                         :par2 => "",
                         :par3 => "",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#business
content = Content.create(:par1 => "",
                         :par2 => "",
                         :par3 => "",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#bio
content = Content.create(:par1 => "",
                         :par2 => "",
                         :par3 => "",
                         :par4 => "",
                         :par5 => "",
                         :par6 => ""
)
#500.times do |i|
 # puts "Start Create user #{i}"
 # user = User.create({:email => Faker::Internet.email,:password => 'test',:password_confirmation => 'test'})
#  user = User.create({:login => Faker::Internet.user_name, :id => user.id})
#  user.save
#end

