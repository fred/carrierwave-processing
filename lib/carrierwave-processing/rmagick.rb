module CarrierWave
  module Processing
    module RMagick
      # Strips out all embedded information from the image
      def strip
        manipulate! do |img|
          img.strip!
          img = yield(img) if block_given?
          img
        end
      end

      # Reduces the quality of the image to the percentage given
      def quality(percentage)
        manipulate! do |img|
          img.write(current_path){ self.quality = percentage }
          img = yield(img) if block_given?
          img
        end
      end

      # Auto Orients images
      # may not work if using stip, since orientation is in the EXIF data
      def rotate
        manipulate! do |img|
          img = img.auto_orient
          img = yield(img) if block_given?
          img
        end
      end
    end
  end
end
