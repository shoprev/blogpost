module Blogpost
  class Livedoor
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title],content: opts[:content])
      service = client.get_service "http://livedoor.blogcms.jp/atom/"
      collection_uri = service.workspace.collections[0].href
      client.create_entry(collection_uri, entry)
    end
  end
end
