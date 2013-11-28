module Blogpost
  class Sendmail
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      opts[:port] = "25" unless opts.key?(:port)
      opts[:host] = "localhost" unless opts.key?(:host)
      opts[:user] = "from@example.com" unless opts.key?(:user)
      options = { :address              => opts[:host],
                  :port                 => opts[:port],
                  :enable_starttls_auto => false  }
      Mail.defaults do
        delivery_method :smtp, options
      end
      mail = Mail.new do
             to opts[:address]
           from opts[:user]
        subject opts[:title]
           body opts[:content]
content_type 'text/html; charset=UTF-8'
      end
      mail.deliver
    end
  end
end
