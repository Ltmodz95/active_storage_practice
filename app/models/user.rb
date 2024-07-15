class User < ApplicationRecord
  has_one_attached :profile_photo

  private

  def valid_image
    return unless profile_photo.attached?

    return if profile_photo.blob.byte_size <= 1.megabyte

    errors.add(:profile_photo, 'photo must be less than or equal to 1MB')
  end
end
