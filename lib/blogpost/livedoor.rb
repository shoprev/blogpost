module Blogpost
  class Livedoor
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title].encode("BINARY", "BINARY"),content: opts[:content].encode("BINARY", "BINARY"))
      # 複数ブログ対応
      end_point_url = "https://livedoor.blogcms.jp/atompub/#{opts[:multiple].nil? ? opts[:user] : opts[:multiple]}"
      service = client.get_service end_point_url
      collection_uri = service.workspace.collections[0].href
      client.create_entry(collection_uri, entry)
    end
  end
end
