class Link < Post
  validates_presence_of :url
  validates_format_of :url, :with => %r{^http://.+$}i, :message => 'must be a valid url'
end
