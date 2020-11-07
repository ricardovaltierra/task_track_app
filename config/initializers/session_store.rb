if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_track_app", same_site: :Strict, secure: true
else
  Rails.application.config.session_store :cookie_store, key: "_track_app"
end
