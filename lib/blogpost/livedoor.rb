require 'tempfile'

module Blogpost
  class Livedoor
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user],password: opts[:pass])
      client = Atompub::Client.new(auth: auth)
      entry  = Atom::Entry.new(title: opts[:title].encode("BINARY", "BINARY"),content: opts[:content].encode("BINARY", "BINARY"))
      # 複数ブログ対応
      end_point_url = "https://livedoor.blogcms.jp/atompub/#{opts[:multiple].nil? ? opts[:user] : opts[:multiple]}"
      service = client.get_service end_point_url
      collection_uri = service.workspace.collections[0].href
      client.create_entry(collection_uri, entry)
    end

    #
    # opts = {
    # :user =>
    # :pass =>
    # :image_path or :image_url =>
    # :multiple => # 1アカウントでの複数ブログ対応
    # }
    def self.image_post(opts={})
      opts   = Blogpost.options.merge(opts)
      auth   = Atompub::Auth::Wsse.new(username: opts[:user], password: opts[:pass])
      client = Atompub::Client.new(auth: auth)

      filename = nil
      if opts[:image_path]
        filename = opts[:image_path]
      elsif opts[:image_url]
        tempfile = ::Tempfile.new(['temp','.jpg'])
        tempfile.write open(opts[:image_url]).read
        tempfile.close
        filename = tempfile.path
      end

      # 複数ブログ対応
      end_point_url = "https://livedoor.blogcms.jp/atompub/#{opts[:multiple].nil? ? opts[:user] : opts[:multiple]}"
      service        = client.get_service end_point_url
      collection_uri = service.workspace.collections[1].href

      # 画像リソースの転送。
      media_entry_uri = client.create_media(collection_uri, filename, 'image/jpeg')

      media_url = nil
      if media_entry_uri != nil
        media_entry = client.get_entry(media_entry_uri)

        if media_entry != nil
          media_entry.elem.each_element("content") do |element|
            # 画像本体の URL の取得。
            media_url = element.attributes['src']
          end
        end
      end
      media_url
    end
  end
end
