class Guest < ApplicationRecord
  validates :color, format: { with: /[0-9A-Fa-f]{6}/ }, allow_nil: true
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9 ]+\z/ }

  before_validation :add_color, on: :create
  after_initialize  :add_color if :new_record?

  before_validation :add_image, on: :create
  after_initialize  :add_image if :new_record?

  private

  def add_color
    return nil unless color.blank?

    self.color = ''
    3.times.each { self.color += '%02X' % Random.rand(0..255) }
  end

  def add_image
    return nil unless image_number.blank? || image_number.zero?

    self.image_number = Random.rand(0..100)
  end
end
