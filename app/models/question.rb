class Question < ApplicationRecord
  belongs_to :user

  validates :text, length: { minimum: 3, maximum: 255 }
end
