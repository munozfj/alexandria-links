Paperclip.interpolates(:s3_url) { |attachment, style|
   "#{attachment.s3_protocol}://s3-sa-east-1.amazonaws.com/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/},
   "")}"
   }
