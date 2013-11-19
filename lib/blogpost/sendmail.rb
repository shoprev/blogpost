module Blogpost
  class Sendmail
    def self.post(opts={})
      opts = Blogpost.options.merge(opts)
      opts[:port] = "25" unless opts.key?(:port)
      opts[:host] = "localhost" unless opts.key?(:host)
      opts[:user] = "from@example.com" unless opts.key?(:user)
body = <<EOT
From: #{opts[:user]}
To: #{opts[:address]}
Subject: #{opts[:title]}
Date: #{Time::now.strftime("%a, %d %b %Y %X %z")}
Content-Type: text/html; charset=UTF-8

#{opts[:content]}
EOT
      Net::SMTP.start(opts[:host], opts[:port]) do |smtp|
        smtp.send_mail body, opts[:user], opts[:address]
      end
    end
  end
end
