# Imports the Google Cloud client library
require "google/cloud/storage"

project_id = "pulibrary-figgy-storage-1"
bucket_name = "pulibrary-figgy-preservation-1"

def upload_bags(archived_bag_path, bucket)
  Dir["#{archived_bag_path}/*.gz"].each do |path|
    begin
      puts "uploading #{path}"
      filename = File.basename(path)
      md5 = Digest::MD5.file(path).base64digest
      bucket.create_file(path, "bags-test/#{filename}", md5: md5)
      puts "Uploaded #{filename}"
    rescue Google::Cloud::InvalidArgumentError => e
      puts "#{filename}: #{e.message}"
      next
    end
  end
end

storage = Google::Cloud::Storage.new project_id: project_id
bucket = storage.bucket bucket_name
archived_bag_path = ENV['BAG_DIRECTORY']

upload_bags(archived_bag_path, bucket)
