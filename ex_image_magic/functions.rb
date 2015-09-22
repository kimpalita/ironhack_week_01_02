require 'mini_magick'


class ImageFiles

	def save_original(file_name, temp_file_path)
		image_file = MiniMagick::Image.open(temp_file_path)
		image_file.write "public/images/#{file_name}"
	end


	def to_thumbnail(file_name, temp_file_path)
		image_file = MiniMagick::Image.open(temp_file_path)
		image_file.resize "100x100"
		image_file.write "public/thumbnails/#{file_name}"
	end
end