# gcp-playground
experimentation with nearline storage for preservation

## Authenticate for logging into virtual machines

1. Install google-cloud-sdk: `brew cask install google-cloud-sdk`
1. Login to google cloud: `gcloud auth login`
1. Add public ssh key:
   
   ```
   gcloud compute os-login ssh-keys add --key-file ~/.ssh/id_rsa.pub --ttl 0
   ```
1. When logging in to VMs, the user name is `netid_princeton_edu`

## Create an API key
https://cloud.google.com/storage/docs/reference/libraries#client-libraries-install-ruby
download it to your machine somewhere

## Upload bags to Nearline
On a server with access to the bags directory
1 clone this repo and bundle install
1 run the upload script
`GOOGLE_APPLICATION_CREDENTIALS=path/to/key.json BAG_DIRECTORY=path/to/bags bundle exec ruby lib/nearline/upload.rb`

## Download bags from Nearline
On a server with access to the bags directory
1 clone this repo and bundle install
1 run the download script
`GOOGLE_APPLICATION_CREDENTIALS=path/to/key.json DOWNLOAD_DIRECTORY=path/to/bags bundle exec ruby lib/nearline/download.rb`

## Google Cloud Storage API

http://googleapis.github.io/google-cloud-ruby/docs/google-cloud-storage/latest/

