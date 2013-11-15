require "blogpost"

# # hatena blog
# Blogpost.configure do |options|
#   options[:user]   = 'user id'
#   options[:pass]   = "api key"
#   options[:domain] = "example.hatenablog.com"
# end
# Blogpost::Hatenablog.post({:title => "title" , :content => "content"})

# Blogpost::Athera.post({:user => "rakutenbook", :pass => "7CCPbiNgGm7LkVvO", :title => "title" , :content => "content"})
# Blogpost::Maruta.post({:user => "rakutenbook", :pass => "07rakuten", :title => "title" , :content => "content"})
Blogpost::Wordpress.post({:user => "rakutenbook", :pass => "07rakuten", :title => "title" , :content => "content"})
