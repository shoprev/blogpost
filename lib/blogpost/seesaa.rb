module Blogpost
  class Seesaa
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="http://blog.seesaa.jp/rpc"
      id = XMLRPC::Client.new2(host).call("blogger.getUsersBlogs", "",opts[:user], opts[:pass])[0]["blogid"]
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", id, opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
