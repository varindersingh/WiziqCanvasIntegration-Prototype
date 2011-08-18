# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'net/http'
require 'rexml/document'


class ResponseData

  attr_reader :doc_root,:api_method,:api_msg,:api_code,:api_status
  attr_accessor :optional_params
  def initialize(response_xml)

    @optional_params = []
    res_doc = REXML::Document.new(response_xml,{:compress_whitespace => :all})
    @doc_root = res_doc.root
    raise 'Invalid api response' if @doc_root.blank?
    @api_status = @doc_root.attributes["status"]
    @api_method = @doc_root.elements["method"].text if !@doc_root.elements["method"].blank?  
    @api_msg = @doc_root.elements["error"].attributes["msg"] if !@doc_root.elements["error"].blank?
    @api_code = @doc_root.elements["error"].attributes["code"] if !@doc_root.elements["error"].blank?

  end  

  # parse response based upon api_method

  
  def parse_schedule_class_response

    hash = Hash.new
    
    class_id = @doc_root.elements["//class_id"].text
    hash.store("class_id",class_id)
    recording_url = @doc_root.elements["//recording_url"].text
    hash.store("recording_url",recording_url)
    presenters = []
    @doc_root.elements["//presenter"].each do |presenter|
      
      next if presenter.type == REXML::Text      
      
      Rails::logger.debug " presenter is #{ presenter.to_s } "
      Rails::logger.debug " presenter[//pr_id] is #{ presenter.elements['//presenter_id'].text }  "
      Rails::logger.debug " presenter[//pr_url] is #{ presenter.elements['//presenter_url'].text }  "
      
      presenters << Hash[
        "presenter_url",presenter.elements["//presenter_url"].text,
        "presenter_id",presenter.elements["//presenter_id"].text
      ]

    end        
    hash.store("presenters",presenters)

    hash    

  end


  def parse_add_attendee_response

    hash = Hash.new
    class_id = @doc_root.elements["//class_id"].text
    hash.store("class_id",class_id)   
    hash.store("attendee_id", @doc_root.elements["//attendee_id"].text)
    hash.store("attendee_url", @doc_root.elements["//attendee_url"].text)
    hash.store("language" , @doc_root.elements["//language"].text)        
    hash

  end


  def parse_class_info

    hash = Hash.new
    Rails::logger.debug " each debug s  "
    begin
      @optional_params.each do |node|

        Rails::logger.debug " each debug stub  #{ node.type  }  "
        next if node.type == REXML::Text
      
        hash.store(node,@doc_root.elements["//#{ node }"].text)
        Rails::logger.debug " parsing class launch node =>  #{ node }, value => #{ @doc_root.elements["//#{ node }"].text  if !@doc_root.elements["//#{ node }"].blank?  }  "

      end
    rescue
      false
    end
    hash        
  end

  
end
