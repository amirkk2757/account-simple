# account_id = "134319464995"
region     = "us-east-2"

spoke_vpcs = {
  spoke-a = {
    name                  = "spoke-a"
    cidr_block            = "10.20.0.0/16"
    number_azs            = 2
    endpoint_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
    workload_subnet_cidrs = ["10.20.20.0/24", "10.20.21.0/24"]
  }
}