class S3UploadJob < Struct.new(:upload_id)
  def perform
    Upload.find(upload_id).upload_to_s3
  end
end
