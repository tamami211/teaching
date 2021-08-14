class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :students, dependent: :destroy

         has_many :likes, dependent: :destroy
         has_many :liked_students, through: :likes, source: :student

         has_many :comments, dependent: :destroy

         has_many :tweets, dependent: :destroy

         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } 

         def already_liked?(student)
          self.likes.exists?(student_id: student.id)
        end
end
