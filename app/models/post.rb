class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary,  length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_it_clickable


    def is_it_clickable
        unless title.present? && title.include?("Won't Believe"||"Secret"||"Top [number]"||"Guess")
            errors.add(:title, "needs to be more clickbait")
        end
    end

end
