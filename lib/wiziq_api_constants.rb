
module WiziqApiConstants

  module ParamsAuth

    TIMESTAMP = "timestamp"
		ACCESS_KEY = "access_key"
		SIGNATURE = "signature"
    
  end

  module ApiMethods

    SCHEDULE = "create"
		LIST = "get_data"		
		UPDATE = "modify"
		CANCEL = "cancel"
		TIMEZONE = "get_time_zone"
    ADDATTENDEE = "add_attendees"
		ATTENDEE_REPORT = "get_attendance_report"

  end

  module ParamsSchedule

    CLASS_ID = "class_id"
    TITLE = "title"
    COURSE_ID = "course_id"
    PRESENTER_ID = "presenter_id"
    PRESENTER_NAME = "presenter_name"
    PRESENTER_CONTROL_TYPE = "presenter_default_controls"
    START_DATETIME = "start_time"
    DURATION = "duration"
    DESCRIPTION = "description"
    TIMEZONE = "time_zone"
    ATTENDEE_LIMIT = "attendee_limit"
    ATTENDEE_XML = "attendee_list"
    CREATE_CLASS_REC = "create_recording"
    AUTO_REC_CLASS = "auto_record_class"
    ATTENDEE_RET_URL = "attendee_return_url"
    ORG_URL = "organization_url"
    STAT_PING_URL = "status_ping_url"


  end

  module ParamsList

    CLASS_ID = "class_id"
    TITLE = "title"
    COURSE_ID = "course_id"
    PRESENTER_ID = "presenter_id"
    PRESENTER_NAME = "presenter_name"
    PRESENTER_CONTROL_TYPE = "presenter_default_controls"
    START_DATETIME = "start_time"
    DURATION = "duration"
    DESCRIPTION = "description"
    TIMEZONE = "time_zone"      
    CREATE_CLASS_REC = "create_recording"
    AUTO_REC_CLASS = "auto_record_class"
    ATTENDEE_RET_URL = "attendee_return_url"
    ORG_URL = "organization_url"
    STAT_PING_URL = "status_ping_url"
    PAGE_INDEX = "page_number"
		PAGE_SIZE = "page_size"
		STATUS = "status"
		SORT_COLUMN = "sort_by"
		SORT_DIRECTION = "sort_direction"
		CLASS_ID = "class_id"
		PRESENTER_ID = "presenter_id"
		COURSE_ID = "course_id"
		ATTENDEE_ID = "attendee_id"
		COLUMNS = "columns"

  end

  module ListColumnOptions

    CLASS_ID = "class_id"
		TITLE = "title"
		PRESENTER_URL = "presenter_url"
		DURATION = "duration"
		DESCRIPTION = "description"
		PRESENTER_ID = "presenter_id"
		RECORDING_URL = "recording_url"
		TIMEZONE = "time_zone"
		TIME_TO_START = "time_to_start"
		ATTENDEE_LIMIT = "attendee_limit"
		ATTENDEE_XML = "attendee_list"
		ATTENDEE_URL = "attendee_url"
		ATTENDEE_ID = "attendee_id"
		CREATE_CLASS_REC = "create_recording"
		AUTO_REC_CLASS = "auto_record_class"
		ATTENDEE_RET_URL = "attendee_return_url"
		ORG_URL = "organization_url"
		PRESENTER_CONTROLS = "presenter_default_controls"
		STAT_PING_URL = "status_ping_url"
		START_DATETIME = "start_time"
		RECORDING_STATUS = "recording_status"
		STATUS = "status"
		ATTENDANCE_REPORT_STATUS = "attendance_report_status"

  end

  module ClassStatus

    UPCOMING = "upcoming"
    EXPIRED = "expired"
    COMPLETED = "completed"

  end

  module  ParamsUpdate


  end

  module ParamsCancel

    
  end

  module ResponseNodes

    
  end



end