class Events::Index < ApiAction
  @events : EventQuery?

  param device_id : String?
  param trigger_id : String?

  get "/events" do
    json EventSerializer.for_collection(events)
  end

  private def events
    @events ||= EventQuery.new.by_trigger_id(trigger_id).by_device_id(device_id)
  end
end
