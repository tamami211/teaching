class Student < ApplicationRecord
    #アソシエーション(1:多)
  belongs_to :user
end
