class EventLogger

  def self.track_resource(resource_name,resource_id,action)
    RestClient.post "localhost:3000/events/create.json", { :application => "FlyWheel", :label => "data transaction", :details => {:resource_name => resource_name, :resource_id => resource_id.to_i},:test => 1} 
  end
end
