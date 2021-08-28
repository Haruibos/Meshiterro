class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # UserモデルにPostImageモデルを関連付ける       
  # belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することができます。
  # PostImageモデルに関連付けられるのは、1つのUserモデルです。
  # このため、単数形の「user」になっている点に注意しましょう。
  has_many :post_images, dependent: :destroy
end
