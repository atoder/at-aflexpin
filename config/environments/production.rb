Rails.application.configure do
	# settings specified here will take precedence over those in config/application.rb.
	
	# code is not reloaded between requests.
	config.cache_classes = true
	
	# eager load code on boot. this eager loads most of rails and
	# your application in memory, allowing both threaded web servers
	# and those relying on copy on write to perform better.
	# rake tasks automatically ignore this option for performance.
	config.eager_load = true
	
	# full error reports are disabled and caching is turned on.
	config.consider_all_requests_local       = false
	config.action_controller.perform_caching = true
	
	# enable rack::cache to put a simple http cache in front of your application
	# add `rack-cache` to your gemfile before enabling this.
	# for large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
	# config.action_dispatch.rack_cache = true
	
	# disable rails's static asset server (apache or nginx will already do this).
	config.serve_static_assets = false
	
	# compress javascripts and css.
	config.assets.js_compressor = :uglifier
	# config.assets.css_compressor = :sass
	
	# do not fallback to assets pipeline if a precompiled asset is missed.
    # @TODO:
    # AT: Should be false c hanged this to true becase
    # but glyphicons get messed up on production
    # continue checking this thread http://stackoverflow.com/questions/20588786/glyphicon-works-locally-but-not-on-heroku
	config.assets.compile = true
	
	# generate digests for assets urls.
	config.assets.digest = true
	
	# version of your assets, change this if you want to expire all your assets.
	config.assets.version = '1.0'
	
	# specifies the header that your server uses for sending files.
	# config.action_dispatch.x_sendfile_header = "x-sendfile" # for apache
	# config.action_dispatch.x_sendfile_header = 'x-accel-redirect' # for nginx
	
	# force all access to the app over ssl, use strict-transport-security, and use secure cookies.
	# config.force_ssl = true
	
	# set to :debug to see everything in the log.
	config.log_level = :info
	
	# prepend all log lines with the following tags.
	# config.log_tags = [ :subdomain, :uuid ]
	
	# use a different logger for distributed setups.
	# config.logger = activesupport::taggedlogging.new(sysloglogger.new)
	
	# Use a different cache store in production.
	# config.cache_store = :mem_cache_store
	
	# Enable serving of images, stylesheets, and JavaScripts from an asset server.
	# config.action_controller.asset_host = "http://assets.example.com"
	
	# Precompile additional assets.
	# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
	# config.assets.precompile += %w( search.js )
    # for font awesome and twitter glyphicons to work
    config.assets.precompile += %w( '.woff', '.eot', '.svg', '.ttf' )
	
	# Ignore bad email addresses and do not raise email delivery errors.
	# Set this to true and configure the email server for immediate delivery to raise delivery errors.
	# config.action_mailer.raise_delivery_errors = false
	
	# Enable locale fallbacks for I18n (makes lookups for any locale fall back to
	# the I18n.default_locale when a translation cannot be found).
	config.i18n.fallbacks = true
	
	# Send deprecation notices to registered listeners.
	config.active_support.deprecation = :notify
	
	# Disable automatic flushing of the log to improve performance.
	# config.autoflush_log = false
	
	# Use default logging formatter so that PID and timestamp are not suppressed.
	config.log_formatter = ::Logger::Formatter.new
	
	# Do not dump schema after migrations.
	config.active_record.dump_schema_after_migration = false

    #Note to set this to your actual host 
    # required for Heroku
    config.action_mailer.default_url_options = { :host => 'http://aflexpin.herokuapp.com/' }    

    # Sets Paperclip to upload images to Amazon S3
    config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
        :bucket => ENV['AWS_BUCKET'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
    }

    Rails.application.routes.default_url_options = 'http://aflexpin.herokuapp.com'
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.default :charset => "utf-8"

    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        domain: ENV["GMAIL_DOMAIN"],
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: ENV["GMAIL_USERNAME"],
        password: ENV["GMAIL_PASSWORD"]
    }


end
