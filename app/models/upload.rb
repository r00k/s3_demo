class Upload < ActiveRecord::Base
  LOCAL_STORAGE_DIRECTORY = Rails.root.join('tmp', 'uploads')
  S3_ROOT_URL = 'http://s3.amazonaws.com/codeulate-demo/'

  after_save :upload_to_s3

  def self.store_locally(uploaded_data)
    file_path = LOCAL_STORAGE_DIRECTORY.join(uploaded_data.original_filename)
    File.open(file_path, 'w') { |file| file.write(uploaded_data.read) }
    file_path.to_s
  end

  def s3_key
    File.basename(local_path)
  end

  def upload_to_s3
    S3Upload.store(s3_key, open(local_path), :access => :public_read)
  end

  def s3_url
    S3_ROOT_URL + s3_key
  end
end
