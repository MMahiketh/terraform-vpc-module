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


## Outputs

* *vpc_id* : ID of the created VPC.

* *igw_id* : ID of the created Internet Gateway.

