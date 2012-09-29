# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
AlexandriaLinks::Application.initialize!

require 'aws/s3'
AWS::S3::DEFAULT_HOST = "s3-sa-east-1.amazonaws.com" # Sao Paulo
