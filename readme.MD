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


## Outputs

* *vpc_id* : ID of the created VPC.

* *igw_id* : ID of the created Internet Gateway.

* *all_azs_info* : Info about all Availability Zones in the region.

* *selected_azs* : List of Availability Zones that are selected.