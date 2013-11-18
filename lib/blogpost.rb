require "atomutil"
require "xmlrpc/client"
require "blogpost/version"
require "blogpost/hatenablog"
require "blogpost/hatenadiary"
require "blogpost/athera"
require "blogpost/maruta"
require "blogpost/wordpress"
require "blogpost/fc2"
require "blogpost/livedoor"
require "blogpost/goo"
require "blogpost/seesaa"
require "blogpost/webry"
require "blogpost/jugem"

module XMLRPC::ParseContentType
  def parse_content_type(str)
    a, *b = str.split(";")
    a = "text/xml" if a == "application/xml"
    return a.strip.downcase, *b
  end
end

module Blogpost
  
  @options ={}
  
  def options
    @options
  end

  def configure(&proc)
    raise ArgumentError, "Block is required." unless block_given?
    yield @options
  end

  module_function :options, :configure
end
