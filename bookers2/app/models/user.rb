class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_one_attached :profile_image
 has_many :books,dependent: :destroy
 
 def after_sign_in_path_for
  
 end
 
 def after_sign_out_path_for
  
 end
 
end
