module Blogpost
  class Gmail
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      options = { :address              => "smtp.gmail.com",
                  :port                 => 587,
                  :domain               => 'gmail.com',
                  :user_name            => opts[:user],
                  :password             => opts[:pass],
                  :authentication       => 'plain',
                  :enable_starttls_auto => true  }
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
