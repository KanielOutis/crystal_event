class CreateEvents::V20211222104835 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Event) do
      primary_key id : UUID
      add_timestamps
      add device_id : String?
      add trigger_id : String?
      add trigger_type : String?
      add type : String?
      add detection_time : Time?
      add extra : JSON::Any?
    end
  end

  def rollback
    drop table_for(Event)
  end
end
