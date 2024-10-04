# Terraform Module for Customised VPC in AWS

This module is going to create below resources.

* VPC


## Inputs

* *project* (Mandatory) `string` : User must provide their project name.

* *environment* (Mandatory) `string` : User must provide the envirmonment(PROD, DEV, QA).

* *vpc_cidr_block* (Mandatory) `string` : User must provide CIDR for VPC.

* *vpc_dns_hostnames* (Optional) `boolean` : Set false if you donot need "DNS hostnames" in our VPC. By default set to true.


## Outputs

* *vpc_id* : ID of the created VPC.

