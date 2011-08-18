# To change this template, choose Tools | Templates
# and open the template in the editor.

#require 'wiziq_api_constants'

require 'hpricot'
#require 'wiziq_api_constants'
# Test comment

class AgliveComUtil


  attr_reader :api_request,:api_method,:attendee_url

  def initialize(api_method)

    Rails::logger.debug "AgliveComUtil initialize here"
    
    raise 'Unrecognized api_method' if api_method.kind_of?(WiziqApiConstants::ApiMethods)
    @api_method = api_method
    @api_request = BaseRequestBuilder.new(api_method)    
    
  end


  def schedule_class(wiziq_conference)

    Rails::logger.debug " self is #{ self.to_s }"

    @api_request.add_params(

      "title" => wiziq_conference.title,
      "start_time" =>  Time.now.strftime("%m/%d/%Y %H:%M:%S %p"),
      "description" => wiziq_conference.description,
      "duration" => wiziq_conference.duration,
      "time_zone" => wiziq_conference.time_zone,
      "presenter_id" => wiziq_conference.user.uuid,
      "presenter_email" => "vicky98284@gmail.com",
      "presenter_name" => wiziq_conference.user.name,
      "presenter_default_controls" => "audio,video"
    )   

    response_data  = ResponseData.new(@api_request.send_api_request);

    response_data.parse_schedule_class_response    
   
  end

  def add_attendee_to_session(class_id,attendee_id,screen_name)

    attendee_util = AttendeeUtil.new
    attendee_util.add_attendee(attendee_id, screen_name)

    @api_request.add_params(
        
      "class_id" => class_id,
      "attendee_list" => attendee_util.get_attendee_xml    
    )

    response_data = ResponseData.new(@api_request.send_api_request)

    response_data.parse_add_attendee_response       
    
  end


  def get_wiziq_class_status(class_id)

    @api_request.add_param(WiziqApiConstants::ParamsList::CLASS_ID, class_id)
    @api_request.add_param(WiziqApiConstants::ParamsList::STATUS, WiziqApiConstants::ClassStatus::UPCOMING)
    @api_request.add_param(WiziqApiConstants::ParamsList::COLUMNS, WiziqApiConstants::ListColumnOptions::TIME_TO_START)
    response_data = ResponseData.new(@api_request.send_api_request)
    response_data.optional_params = WiziqApiConstants::ListColumnOptions::TIME_TO_START
    response_data.parse_class_info
    
  end

  def get_class_presenter_info(class_id,optional_colums={})

    
    @api_request.add_param(WiziqApiConstants::ParamsList::CLASS_ID, class_id)
    @api_request.add_param(WiziqApiConstants::ParamsList::COLUMNS, optional_colums.join(","))
    response_data = ResponseData.new(@api_request.send_api_request)
    Rails::logger.debug "   agliveinfo get presenter info "
    response_data.optional_params = optional_colums
    response_data.parse_class_info

  end

  def get_class_attendee_info(class_id,optional_colums={})

    @api_request.add_param(WiziqApiConstants::ParamsList::CLASS_ID, class_id)
    @api_request.add_param(WiziqApiConstants::ParamsList::COLUMNS, optional_colums.join(","))
    response_data = ResponseData.new(@api_request.send_api_request)
    Rails::logger.debug "   agliveinfo get attendee info "
    response_data.optional_params = optional_colums
    response_data.parse_class_info

  end

  

end
