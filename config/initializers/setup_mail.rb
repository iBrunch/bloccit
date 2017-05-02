if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '2525',
    authentication: :plain,
    user_name:      ENV['app64842291@heroku.com'],
    password:       ENV['i4upcf5l9804'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end
