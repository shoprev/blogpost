module Blogpost
  class Hatenadiary
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title].encode('BINARY', 'BINARY'),content: opts[:content].encode('BINARY', 'BINARY'))
      client.create_entry("http://d.hatena.ne.jp/#{opts[:user]}/atom", entry)
    end
  end
end
