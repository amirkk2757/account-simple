# checkov:skip=CKV_ALL
module "spoke_vpcs" {
  for_each = var.spoke_vpcs
  source   = "aws-ia/vpc/aws"
  version  = "= 4.4.4"

  name       = each.value.name
  cidr_block = each.value.cidr_block
  az_count   = each.value.number_azs

  subnets = {
    vpc_endpoints = { cidrs = each.value.endpoint_subnet_cidrs }
    workload      = { cidrs = each.value.workload_subnet_cidrs }
  }
}




