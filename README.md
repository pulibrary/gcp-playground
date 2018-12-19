# gcp-playground
experimentation with nearline storage for preservation

## Create a key
https://cloud.google.com/storage/docs/reference/libraries#client-libraries-install-ruby
download it to your machine somewhere

## Upload bags to Nearline
On a server with access to the bags directory
1 clone this repo and bundle install
1 start an irb console
`GOOGLE_APPLICATION_CREDENTIALS=path/to/key.json ruby lib/nearline.rb`
