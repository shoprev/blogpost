module Blogpost
  class Hatenadiary
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title].encode('BINARY', 'BINARY'),content: opts[:content].encode('BINARY', 'BINARY'))
      service = client.get_service "http://d.hatena.ne.jp/#{opts[:user]}/atom" #"http://d.hatena.ne.jp/%s/atom" % @user
      collection_uri = service.workspace.collections[1].href
      client.create_entry(collection_uri, entry)
    end
  end
end
