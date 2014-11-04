module EventTracker
  extend ActiveSupport::Concern

  included do
    after_save :track_save
  end

  def track_save
#    EventLogger.track_resource self.class,self.id,"save"
  end
end
