VkontakteApi.configure do |config|
  config.app_id       = '5098674'      # ID приложения
  config.app_secret   = 'GZfcaiS8O4dNNoLaiBGe' # защищенный ключ
  config.redirect_uri = 'http://localhost:3000/callback'


  # HTTP verb for API methods (:get or :post)
  config.http_verb = :get
  config.adapter = :net_http
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  config.log_requests  = true  # URL-ы запросов
  config.log_errors    = true  # ошибки
  config.log_responses = false # удачные ответы

  # log requests' URLs
  # config.log_requests = true

  # log response JSON after errors
  # config.log_errors = true

  # log response JSON after successful responses
  # config.log_responses = false
end

# create a short alias VK for VkontakteApi module
# VkontakteApi.register_alias
