class EventQuery < Event::BaseQuery
  def by_device_id(device_id)
    device_id ? self.device_id.nilable_eq(device_id) : self
  end

  def by_trigger_id(trigger_id)
    trigger_id ? self.trigger_id.nilable_eq(trigger_id) : self
  end
end
