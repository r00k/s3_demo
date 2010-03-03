require 'test_helper'
require 'tempfile'

class UploadTest < ActiveSupport::TestCase

  NEW_FILE = Rails.root.join('tmp', 'uploads', 'foo.txt')

  def teardown
    File.delete(NEW_FILE) if File.exists?(NEW_FILE)
  end

  test "store_locally" do
    Tempfile.open('tempfile.txt') do |tempfile|
      tempfile.stubs(:original_filename => 'foo.txt')

      assert !File.exists?(NEW_FILE)
      Upload.store_locally(tempfile)
      assert File.exists?(NEW_FILE)
    end
  end

end
