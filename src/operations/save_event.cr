class SaveEvent < Event::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #

  permit_columns device_id, trigger_id, trigger_type, type, detection_time, extra

  upsert_lookup_columns :id
end
