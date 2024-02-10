AppConfig.url = ApplicationConfiguration.new
AppConfig.url.protocol = "http://"
AppConfig.url.subdomain = "www."
AppConfig.url.domain = "localhost" #"socialship"#"sc.net"
AppConfig.url.port = ":3000"
AppConfig.url.root = "#{AppConfig.url.protocol}#{AppConfig.url.subdomain}#{AppConfig.url.domain}#{AppConfig.url.port}"
AppConfig.url.ssl_root = "https://#{AppConfig.url.subdomain}#{AppConfig.url.domain}"

AppConfig.routes = ApplicationConfiguration.new
AppConfig.routes.subdomain = "www"
AppConfig.routes.protocol = "http"
AppConfig.routes.secure = false

##config.hosts << /.*\.sc.net
#config.hosts << www.sc.net:3000
#Rails.application.config.hosts << /.*\.product\.com/

# .env
#Recaptcha.configure do |config|
#  config.site_key  = '6Ld2GVgpAAAAAOzvczmIVDHJelL0LNSWdvXQ-PBD'
#  config.secret_key = '6Ld2GVgpAAAAAIU-uzBAAqyapBJ2XkN7LYrs5l1y'
#end