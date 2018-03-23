class NotifyCreateStoreJob < Struct.new(:user_id)

  def perform
    UserMailer.notify_create_store_email(
      User.find(user_id)
    ).deliver_now
  end

end