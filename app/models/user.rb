class User < ApplicationRecord

  after_create :send_mail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # validates :name, presence: true
  has_many :albums
  has_many :pictures, through: :albums

  def send_mail
    Delayed::Job.enqueue(NotifyCreateStoreJob.new(id))
  end
end
