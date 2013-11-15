# Blogpost

Ruby Blog Post (hatena,athera,fc2,livedoor)

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
Blogpost::Hatenablog.post({:user => "user id", :pass => "api key", :domain => "example.hatenablog.com", :title => "title", :content => "content"})
# hatena diary
Blogpost::Hatenadiary.post({:user => "user id", :pass => "password", :title => "title" , :content => "content"})
# athera
Blogpost::Athera.post({:user => "xml-rpc id", :pass => "xml-rpc pass", :title => "title" , :content => "content"})
# maruta
Blogpost::Maruta.post({:user => "user id", :pass => "password", :title => "title" , :content => "content"})
# wordpress
Blogpost::Wordpress.post({:domain => "example",:user =>"user id", :pass => "password", :title => "title" , :content => "content"})
# fc2
Blogpost::Fc2.post({})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
