			# host="https://bblog.sso.biglobe.ne.jp"
			# path="/ap/xmlrpc"
			# xmlrpc=XMLRPC::Client.new2(host+path)
			# xmlrpc.instance_variable_get(:@http).instance_variable_set(:@verify_mode, OpenSSL::SSL::VERIFY_NONE)
			# id = xmlrpc.call("blogger.getUsersBlogs", "",@user , @pass)[0]["blogid"]
			# xmlrpc.call("metaWeblog.newPost", id, @user, @pass, {"title"=>@title,"description"=>@desc}, true)
module Blogpost
  class Webry
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      host="https://bblog.sso.biglobe.ne.jp/ap/xmlrpc"
      # id = XMLRPC::Client.new2(host).call("blogger.getUsersBlogs", "",opts[:user], opts[:pass])[0]["blogid"]
      XMLRPC::Client.new2(host).call("metaWeblog.newPost", "", opts[:user], opts[:pass],
        {"title" => opts[:title],"description" => opts[:content]}, true)
    end
  end
end
