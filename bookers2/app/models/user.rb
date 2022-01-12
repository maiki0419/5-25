class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one_attached :profile_image
 has_many :books,dependent: :destroy

 def after_sign_in_path_for
  user_path(current_user.id)
 end

 def get_profile_image(size)
   unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/jpeg')
   else
     profile_image.variant(resize: size).processed
   end
 end

end
