module GuestBookHelper
  LOREM_PATH   = 'https://loremflickr.com'.freeze
  SEARCH_TERMS = 'animal,dog,cat'.freeze

  def avitar_image(seed: 0, width: 100, height: 160)
    location = safe_join([LOREM_PATH, width, height, SEARCH_TERMS], '/') + "?lock=#{seed}"
    image_tag(location, width: width, height: height, alt: 'Avitar')
  end
end
