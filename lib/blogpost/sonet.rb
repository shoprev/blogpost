module Blogpost
  class Sonet
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="http://blog.so-net.ne.jp/_rpc"
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
