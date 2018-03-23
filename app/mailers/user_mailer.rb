class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def welcome_email
    # @user = user
    @url = 'http://example.com/login'
    # attachments['image_email.jpg'] = File.read(Rails.root.join('app', 'assets', 'images', 'image_email.jpg'))
    attachments.inline['image_email.jpg'] = File.read(Rails.root.join('app', 'assets', 'images', 'image_email.jpg'))

    mail(to: "aa@gmail.com", subject: 'welcome to My Awesome Site') do |format|
      format.text { render plain: 'Render text' }
    end
  end

  def notify_create_store_email(user)
    @user = user
    subject = "notify_create_store_subject"
    mail(to: @user.email, subject: subject)
  end
end

