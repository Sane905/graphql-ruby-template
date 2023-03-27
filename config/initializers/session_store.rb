# config/initializers/session_store.rb

Rails.application.config.middleware.insert_before Rack::Head, ActionDispatch::Cookies
Rails.application.config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::RedisStore,
  servers: ['redis://redis:6379/0'],
  expire_after: 2.weeks,
  key: "_app_session"