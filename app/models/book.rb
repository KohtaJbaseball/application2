class Book < ApplicationRecord

  has_one_attached :profile_image
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :body, presence: true,
                   length: { minimum: 1, maximum: 200 }

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'na_image.jpg'
    end
  end
end
