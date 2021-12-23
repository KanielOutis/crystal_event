class EventSerializer < BaseSerializer
  def initialize(@event : Event)
  end

  def render
    {
      id:             @event.id,
      device_id:      @event.device_id,
      trigger_id:     @event.trigger_id,
      trigger_type:   @event.trigger_type,
      detection_time: @event.detection_time,
      type:           @event.type,
      extra:          extra,
      created_at:     @event.created_at,
    }
  end

  def extra
    Hash(String, JSON::Any).new(JSON::PullParser.new(%(#{@event.extra})))
  end
end
