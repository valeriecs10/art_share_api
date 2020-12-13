class Like < ApplicationRecord 
  belongs_to :liker,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id 

  belongs_to :likable,
    polymorphic: true
end