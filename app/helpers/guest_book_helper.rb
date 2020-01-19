module GuestBookHelper
  FLICKR_PATH  = 'https://loremflickr.com'.freeze
  SEARCH_TERMS = 'animal,dog,cat'.freeze
  PICSUM_PATH  = 'https://picsum.photos'.freeze

  def avitar_image(seed: 0, width: 100, height: 160)
    picsum_image(seed: seed, width: width, height: height)
  end

  def picsum_image(seed: 0, width: 100, height: 160)
    location = safe_join([PICSUM_PATH, 'seed', seed, width, height], '/')
    image_tag(location, width: width, height: height, alt: 'Avitar')
  end

  def flicker_image(seed: 0, width: 100, height: 160)
    location = safe_join([FLICKR_PATH, width, height, SEARCH_TERMS], '/') + "?lock=#{seed}"
    image_tag(location, width: width, height: height, alt: 'Avitar')
  end
end
