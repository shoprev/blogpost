# Blogpost

[![Gem Version](https://badge.fury.io/rb/blogpost.png)](http://badge.fury.io/rb/blogpost)
Ruby Blog Post (hatena,athera,269g,cocolog,fc2,goo,jugem,livedoor,maruta,seesaa,webry,wordpress,gmail,sendmail)

## Installation

Add this line to your application's Gemfile:

    gem 'blogpost'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blogpost

## Usage

```ruby
require "blogpost"

# hatena blog
Blogpost::Hatenablog.post({:user => "user id", :pass => "api key", 
  :domain => "example.hatenablog.com", :title => "title", :content => "content"})
# hatena diary
Blogpost::Hatenadiary.post({:user => "user id", :pass => "password",
  :title => "title" , :content => "content"})
# athera
Blogpost::Athera.post({:user => "xml-rpc id", :pass => "xml-rpc pass",
  :title => "title" , :content => "content"})
# maruta
Blogpost::Maruta.post({:user => "user id", :pass => "password",
  :title => "title" , :content => "content"})
# wordpress
Blogpost::Wordpress.post({:domain => "example",:user =>"user id",
  :pass => "password", :title => "title" , :content => "content"})
# fc2
Blogpost::Fc2.post({:user =>"user id", :pass => "password",
  :title => "title" , :content => "content"})
# livedoor
Blogpost::Livedoor.post({:user =>"user id", :pass => "api key",
  :title => "title" , :content => "content"})
# goo
Blogpost::Goo.post({:user =>"user id", :pass => "password",
  :title => "title" , :content => "content"})
# seesaa
Blogpost::Seesaa.post({:user =>"email", :pass => "password",
  :title => "title" , :content => "content"})
# webry
Blogpost::Webry.post({:user =>"email", :pass => "passowrd",
  :title => "title" , :content => "content"})
# jugem
Blogpost::Jugem.post({:domain => "example", :user =>"user id",
  :pass => "password", :title => "title" , :content => "content"})
# cocolog
Blogpost::Cocolog.post({:blogid => "blog id", :user =>"user id",
  :pass => "password", :title => "title" , :content => "content"})
# 269g
Blogpost::Blogg.post({:user =>"api id", :pass => "api password",
  :title => "title" , :content => "content"})
# gmail
Blogpost::Gmail.post({:address =>"to@example.com",
  :user =>"from@example.com", :pass => "password",
  :title => "title" , :content => "content"})
# sendmail
Blogpost::Sendmail.post({:address =>"to@example.com",
  :title => "title" , :content => "content"})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
