require "atomutil"
require "blogpost/hatenablog"
require "blogpost/version"

module Blogpost
  
  @options ={}
  
  def options
    @options
  end

  def configure(&proc)
    raise ArgumentError, "Block is required." unless block_given?
    yield @options
  end

end
