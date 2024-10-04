# Terraform Module for Customised VPC in AWS

This module is going to create below resources.

* VPC
* Internet Gateway


## Inputs

* *project* (Mandatory) `string` : User must provide their project name.

* *environment* (Mandatory) `string` : User must provide the envirmonment(PROD, DEV, QA).

* *vpc_cidr_block* (Mandatory) `string` : User must provide CIDR for VPC.

* *vpc_dns_hostnames* (Optional) `boolean` : Set false if you donot need "DNS hostnames" in our VPC. By default it is set to true.

* *vpc_tags* (Optional) `map(string)` : User can supply tags to attach to created vpc. By default it is empty.

* *igw_tags* (Optional) `map(string)` : User can supply tags to attach to created Internet Gateway. By default it is empty.

* *select_azs* (Optional) `list(number)` : User can choose Availability Zones to create subnets. By default it is set to [ 0, 1 ]. You can choose values form 0 to 5. It should be list of 2 distinct elements

* *subnet_cidrs* (Optional) `list(list(string))` : User can supply CIDRs for all subnets created.
    
    Default values are: 
    
>   [

        ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"],   --> AZ1 subnet CIDRs
        ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]    --> AZ2 subnet CIDRs
    ]          ^               ^               ^
               |               |               |      
        ------------------------------------------------
         public-subnet   private-subnet   database-subnet


* *public_subnet_tags* (Optional) `map(string)` : User can supply tags to attach to created public subnet. By default it is empty.

## Outputs

* *vpc_id* : ID of the created VPC.

* *igw_id* : ID of the created Internet Gateway.

* *all_azs_info* : Info about all Availability Zones in the region.

* *selected_azs* : List of Availability Zones that are selected.

* *az1_subnet_cidrs* : List of Public, Private and Database subnet CIDRs in AZ1.

* *az2_subnet_cidrs* : List of Public, Private and Database subnet CIDRs in AZ2.

* *public_subnet_ids* : List of Public subnet IDs.