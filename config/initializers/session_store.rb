if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_track_auth", domain: "https://steptracking-api.herokuapp.com/"
else
  Rails.application.config.session_store :cookie_store, key: "_track_auth"
end