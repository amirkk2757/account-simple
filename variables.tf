# Instructions: Place your variables below
# Definition of the VPCs to create in Oregon Region
# variable "oregon_spoke_vpcs" {
#   type        = any
#   description = "Information about the VPCs to create in us-west-2."

#   default = {
#     "prod" = {
#       type                  = "prod"
#       name                  = "prod-us-west-2"
#       number_azs            = 2
#       cidr_block            = "10.10.0.0/16"
#       workload_subnet_cidrs = ["10.10.0.0/24", "10.10.1.0/24"]
#       endpoint_subnet_cidrs = ["10.10.2.0/28", "10.10.2.16/28"]
#       instance_type         = "t3.micro"
#     }
#     "preprod" = {
#       type                  = "preprod"
#       name                  = "preprod-us-west-2"
#       number_azs            = 2
#       cidr_block            = "10.11.0.0/16"
#       workload_subnet_cidrs = ["10.11.0.0/24", "10.11.1.0/24"]
#       endpoint_subnet_cidrs = ["10.11.2.0/28", "10.11.2.16/28"]
#       instance_type         = "t3.micro"
#     }
#   }
# }


variable "account_id" {
  description = "Target AWS account ID for this run"
  type        = string
}

variable "region" {
  description = "Target AWS region for this run (e.g., us-west-2)"
  type        = string
}

variable "role_name" {
  description = "Cross-account role Terraform assumes"
  type        = string
  default     = "TerraformDeploy"
}

variable "spoke_vpcs" {
  description = "Map of VPCs to create in this target (per run)"
  type = map(object({
    name                  = string
    cidr_block            = string
    number_azs            = number
    endpoint_subnet_cidrs = list(string)
    workload_subnet_cidrs = list(string)
  }))
}
