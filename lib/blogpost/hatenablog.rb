module Blogpost
  class Hatenablog
    def self.post(opts={})
      opts.merge!(Blogpost.options)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title].encode('BINARY', 'BINARY'),content: opts[:content].encode('BINARY', 'BINARY'))
      client.create_entry("https://blog.hatena.ne.jp/#{opts[:user]}/#{opts[:domain]}/atom/entry", entry)
    end
  end
end
