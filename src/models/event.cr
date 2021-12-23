class Event < BaseModel
  macro default_columns
    primary_key id : UUID

    timestamps
  end

  table do
    column device_id : String?
    column trigger_id : String?
    column trigger_type : String?
    column type : String?
    column detection_time : Time?
    column extra : JSON::Any?
  end
end
