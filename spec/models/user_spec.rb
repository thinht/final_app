require 'rails_helper'

# class User < ActiveSupport::TestCase
# RSpec.describe User, type: :model do
#   @product = Product.new
#         assert @product.invalid?

#         assert @product.errors[:name].any?
#   end
# test "Thuoc tinh khong duoc de trong" do
RSpec.describe User, type: :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      user = User.new
      assert user.invalid?
      # comment1 = user.comments.create!(:body => "first comment")
      # comment2 = post.comments.create!(:body => "second comment")
      # expect(post.reload.comments).to eq([comment2, comment1])
    end
  end
  #   end
end
