terraform {
  backend "s3" {
    bucket       = "urbinalabs-muyu-terraform-460383082462"
    key          = "muyu-invoice-domain/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
