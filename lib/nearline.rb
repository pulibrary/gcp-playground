# Imports the Google Cloud client library
require "google/cloud/storage"

project_id = "pulibrary-figgy-storage-1"
bucket_name = "pulibrary-figgy-preservation-1"

def upload_bags(archived_bag_path, bucket)
  Dir["#{archived_bag_path}/*.gz"].each do |path|
    puts "uploading #{path}"
    filename = File.basename(path)
    bucket.create_file(path, "bags-test/#{filename}")
    puts "Uploaded #{filename}"
  end
end

storage = Google::Cloud::Storage.new project_id: project_id
bucket = storage.bucket bucket_name
archived_bag_path = "tmp/archived_bags"

upload_bags(archived_bag_path, bucket)
