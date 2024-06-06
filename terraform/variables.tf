
variable "tags" {
  type = object({
    Environment = string
    Project     = string
  })

  default = {
    Environment = "production"
    Project     = "devops-na-nuvem-week"
  }
}

variable "vpc" {
  type = object({
    cidr_block               = string
    name                     = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    cidr_block               = "10.0.0.0/24"
    name                     = "devops-na-nuvem-week-vpc"
    internet_gateway_name    = "devops-na-nuvem-week-vpc-internet-gateway"
    nat_gateway_name         = "devops-na-nuvem-week-vpc-nat-gateway"
    public_route_table_name  = "devops-na-nuvem-week-vpc-public-route-table"
    private_route_table_name = "devops-na-nuvem-week-vpc-private-route-table"
    public_subnets = [{
      name                    = "devops-na-nuvem-week-vpc-public-subnet-1a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "devops-na-nuvem-week-vpc-public-subnet-1b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "devops-na-nuvem-week-vpc-private-subnet-1a"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "devops-na-nuvem-week-vpc-private-subnet-1b"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
    }]
  }
}

variable "eks_cluster" {

  type = object({
    name                              = string
    role_name                         = string
    enabled_cluster_log_types         = list(string)
    access_config_authentication_mode = string
    node_group_name                   = string
    node_group_capacity_type          = string
    node_group_instance_types         = list(string)
    node_group_role_name              = string
    scaling_config_desired_size       = number
    scaling_config_max_size           = number
    scaling_config_min_size           = number
  })

  default = {
    name      = "devops-na-nuvem-week-eks-cluster"
    role_name = "DevOpsNaNuvemWeekEksClusterRole"
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler"
    ]
    access_config_authentication_mode = "API_AND_CONFIG_MAP"
    node_group_name                   = "devops-na-nuvem-week-eks-node-group"
    node_group_capacity_type          = "ON_DEMAND"
    node_group_instance_types         = ["t3.medium"]
    node_group_role_name              = "DevOpsNaNuvemWeekEksNodeGroupRole"
    scaling_config_desired_size       = 2
    scaling_config_max_size           = 2
    scaling_config_min_size           = 2
  }
}

variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))

  default = [{
    name                 = "devops-na-nuvem-week/production/backend"
    image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "devops-na-nuvem-week/production/frontend"
      image_tag_mutability = "MUTABLE"
  }]
}
