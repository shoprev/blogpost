module Blogpost
  class Cocolog
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="https://app.f.cocolog-nifty.com/t/api"
      # id = XMLRPC::Client.new2(host).call("blogger.getUsersBlogs", "", opts[:user], opts[:pass])[0]["blogid"]
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
