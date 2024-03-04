AppConfig.url = ApplicationConfiguration.new
AppConfig.url.protocol = "http://"
AppConfig.url.subdomain = "" #"www."
AppConfig.url.domain = "localhost" #"socialship"#"sc.net"
AppConfig.url.port = ":3000"
AppConfig.url.root = "#{AppConfig.url.protocol}#{AppConfig.url.subdomain}#{AppConfig.url.domain}#{AppConfig.url.port}"
AppConfig.url.ssl_root = "https://#{AppConfig.url.subdomain}#{AppConfig.url.domain}"

AppConfig.routes = ApplicationConfiguration.new
AppConfig.routes.subdomain = "www"
AppConfig.routes.protocol = "http"
AppConfig.routes.secure = false