module NotificationHelper
  def time_lasted_since(created, notification)
    past_time = (Time.zone.now - created) /60 /60
    if past_time >= 1
      notification.update(status: 0)
      result = past_time.round
      result = result.to_s + "h"
    else
      result = (past_time * 60).round
      result = result.to_s + "m"
    end
    return result
  end
end
