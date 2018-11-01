def image_upload(img)
  logger.info "upload now"
  tempfile = img[:tempfile]
  
  upload = Cloudinary::Uploader.upload(tempfile.path)

  user = User.last

  user.update_attribute(:user_icon, upload['url'])
end

def image_upload_local(img)
  if img
    user = User.last
    id = user.id
    logger.info img
    ext = File.extname(img[:filename])
    img_name = "#{id}-printia#{ext}"
    p "="*20
    logger.info ext
    img_path = "/images/printia/#{img_name}"
    user.update_attribute(:image, img_path)

    save_path = File.join('public', 'images', 'printia', img_name)

    File.open(save_path, 'wb') do |f|
     logger.info "Temp file: #{img[:tempfile]}"
     f.write img[:tempfile].read
     logger.info 'アップロード成功'
    end
  else
    logger.info 'アップロード失敗'
  end
end
