module Blogpost
  class Jugem
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="http://#{opts[:domain]}.jugem.jp/admin/xmlrpc.php"
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
