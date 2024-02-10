AppConfig.url = ApplicationConfiguration.new
AppConfig.url.protocol = "http://"
AppConfig.url.subdomain = "www."
AppConfig.url.domain = "4nkh.ca"
AppConfig.url.port = ""
AppConfig.url.root = "#{AppConfig.url.protocol}#{AppConfig.url.subdomain}#{AppConfig.url.domain}"
AppConfig.url.ssl_root = "https://#{AppConfig.url.subdomain}#{AppConfig.url.domain}"

AppConfig.routes = ApplicationConfiguration.new
AppConfig.routes.subdomain = "www"
AppConfig.routes.protocol = "https"
AppConfig.routes.secure = true
