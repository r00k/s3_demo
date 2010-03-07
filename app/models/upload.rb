class Upload < ActiveRecord::Base
  LOCAL_STORAGE_DIRECTORY = Rails.root.join('tmp', 'uploads')

  def self.store_locally(uploaded_data)
    file_path = LOCAL_STORAGE_DIRECTORY.join(uploaded_data.original_filename)
    File.open(file_path, 'w') { |file| file.write(uploaded_data.read) }
    file_path.to_s
  end

  def s3_key
    File.basename(local_path)
  end
end
