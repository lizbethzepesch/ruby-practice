class UserNotificationsWorker
  include Sidekiq::Worker

  def perform(*args)
    users = User.all
    users.each do |user|
      user.recommendations.each do |recommendation|
        if recommendation.step == recommendation.technique.total_steps && recommendation.ended_at.nil?
          UserNotification.create(body: 'Please, rate the technique if you like it', status: 1, user_id: user.id)
        end
      end
    end
  end
end
