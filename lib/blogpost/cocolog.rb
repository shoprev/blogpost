module Blogpost
  class Cocolog
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="https://app.f.cocolog-nifty.com/t/api"
      # id = XMLRPC::Client.new2(host).call("blogger.getUsersBlogs", "", opts[:user], opts[:pass])[0]["blogid"]
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", opts[:blogid], opts[:user], opts[:pass],
      # XMLRPC::Client.new2(host).call("metaWeblog.newPost", id, opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
