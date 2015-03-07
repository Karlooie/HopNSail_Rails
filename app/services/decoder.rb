require "base64"

module Decoder

  class Image


    def initialize(avatar)
      @image_base64 = avatar[:base64_image]
      @filename = avatar[:filename]
      @file_type = Mime::Type.lookup_by_extension(File.extname(@filename)[1..-1]).to_s
    end


    def decode
      #create a new tempfile named fileupload
      tempfile = Tempfile.new("fileupload")
      tempfile.binmode
      #get the file and decode it with base64 then write it to the tempfile
      tempfile.write(Base64.decode64(@image_base64))
      tempfile.rewind()

      #create a new uploaded file
      uploaded_file = ActionDispatch::Http::UploadedFile.new(
          :tempfile => tempfile, 
          :filename => @filename, 
          :type => @file_type)

      #replace picture_path with the new uploaded file
      return  uploaded_file
    end

  end

end 