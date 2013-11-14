module Blogpost
  class Ninja
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="http://#{opts[:user]}/XMLRPC/"
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "0", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
