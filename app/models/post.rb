class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Non-Fiction Fiction)}
  validate :clickval

  def clickval

    if title != nil
      conditions = [/Won't\sBelieve/, /Secret/, /Guess/, /Top \d/]
        conditions.each do |cond|
          if title.match(cond) != nil
            return true
          end
        end
        errors.add(:non_clickbait, 'is invalid if not clickbait')
    end
  end
end
