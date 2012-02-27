atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
        'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
      feed.title("4nkh development news")
      feed.updated((@posts.first.created_at))
      #feed.tag!(openSearch:totalResults, 10)

      @posts.each do |post|
        feed.entry(post) do |entry|
          entry.title(post.title)
          entry.content(post.body, :type => 'html')
          #entry.tag!('app:edited', Time.now)

          entry.author do |author|
            author.name("4nkh development Team")
          end
        end
      end
    end