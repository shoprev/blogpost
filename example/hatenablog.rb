# coding: utf-8
require "blogpost"

# Blogpost::Hatenablog.post({:user => "rakutenbook", :pass => "lpzunjlfqm", :domain => "rakutenbook.hatenablog.com", :title => "title" , :content => "content"})


Blogpost.configure do |options|
  options[:user]   = 'aaa'
  options[:pass]   = "aaa"
  options[:domain] = "rakutenbook.hatenablog.com"
end
Blogpost::Hatenablog.post({:user => "rakutenbook",:pass => "lpzunjlfqm",:title => "たいとる" , :content => "こんてんつ"})
