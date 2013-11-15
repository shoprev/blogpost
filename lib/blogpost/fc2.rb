module Blogpost
  class Fc2
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="http://blog.fc2.com/xmlrpc.php"
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
