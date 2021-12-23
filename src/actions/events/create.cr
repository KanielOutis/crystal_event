class Events::Create < ApiAction
  post "/events" do
    event = SaveEvent.upsert!(**create_params)
    json EventSerializer.new(event)
  end

  private def create_params
    {
      device_id:      params_hash["device_id"].try(&.to_s),
      trigger_id:     params_hash["trigger_id"].try(&.to_s),
      trigger_type:   params_hash["trigger_type"].try(&.to_s),
      detection_time: detection_time,
      type:           params_hash["type"].try(&.to_s),
      extra:          JSON::Any.new(params_hash["extra"].to_json),
    }
  end

  private def params_hash
    Hash(String, JSON::Any).from_json(params.body)
  end

  private def detection_time
    Time.parse(params.from_json["detection_time"].as_s, "%Y-%m-%d %H:%M:%S", Time::Location::UTC)
  end
end
