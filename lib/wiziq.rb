
#require 'wiziq'
#require 'canvas'
#require 'web_conference'

Rails.configuration.to_prepare do

  require_dependency 'register_plugin'
  require_dependency 'canvas'
  require_dependency 'wiziq'  
  require_dependency 'auth_base'
  require_dependency 'base_request_builder'
  require_dependency 'crypto_helper'
  require_dependency 'wiziq_api_constants'
  require_dependency 'aglive_com_util'
  require_dependency 'response_data'
  require_dependency 'attendee_util'
  require_dependency 'wiziq_conference'
  require_dependency 'web_conference'
  

end
