class Album < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


   # Yêu cầu phải chọn ảnh
 # validates :image, attachment_presence: true
 # Kiểm tra kích thước ảnh
 # validates_attachment :image, size: { in: 0..100.kilobytes }
 # Kiểm tra loại ảnh
 # validates_attachment :image, content_type: { content_type: "image/jpg" }

 # Ta cũng có thể gộp 3 điều kiện trên:
 # validates_attachment :image, presence: true,
  # content_type: { content_type: "image/jpg" },
  # size: { in: 0..100.kilobytes }
end
