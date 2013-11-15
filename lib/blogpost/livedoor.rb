module Blogpost
  class Livedoor
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title],content: opts[:content])
      client.create_entry("http://cms.blog.livedoor.com/atom", entry)
    end
  end
end
