class Post < ApplicationRecord
    validates :contenu, presence:true, length: { maximum: 140 }
    validates :contenu, presence:true, length: { minimum: 1 }
end
