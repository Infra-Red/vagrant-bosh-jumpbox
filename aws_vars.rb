# Ubuntu Amazon EC2 AMI Finder: https://cloud-images.ubuntu.com/locator/ec2/
#
module VarsAws
  AWS_NAME = "bosh-jumpbox"
  AWS_ACCESS_KEY = ""
  AWS_SECRET_KEY = ""
  AWS_KEY_PEMNAME = "keypair"
  AWS_KEY_PEMPATH = "/home/$USER/keypair.pem"
  AWS_UBUNTU_AMI = "ami-5189a661"
  AWS_REGION = "us-west-2"
  AWS_TYPE_INS = "t2.small"
  AWS_SECURITY_GROUPS = ""
end
