class PostPet < ApplicationRecord

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
