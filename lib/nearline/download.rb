require "google/cloud/storage"

download_dir = ENV['DOWNLOAD_DIRECTORY']
project_id = "pulibrary-figgy-storage-1"
bucket_name = "pulibrary-figgy-preservation-1"

# Timeout to 1 day
storage = Google::Cloud::Storage.new project_id: project_id, timeout: 86400
bucket = storage.bucket bucket_name

def download_bags(download_dir, bucket)
  bucket.files.each do |f|
    path = File.join(download_dir, f.name)
    f.download path
    md5 = Digest::MD5.file(path).base64digest
    if f.md5 == md5
      puts "Yay! md5 matched on #{path}"
    else
      puts "Boo! md5 did not match for #{path}"
    end
    File.delete path
  end
end

download_bags(download_dir, bucket)
