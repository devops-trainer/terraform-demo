#resources and data sources
provider "aws" {
    access_key = "AKIAVH7DSWIVKN7PA4VA"
    secret_key = "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"
     region     = "ap-south-1"
}

# creating a new vpc
   resource "aws_vpc" "development-vpc"{

         cidr_block="10.0.0.0/16"
         tags={
               Name: "development",
               vpc_env: "dev"
         }
   }

#creating a subnet in the new vpc

   resource "aws_subnet" "dev-subnet-1"{
         vpc_id = aws_vpc.development-vpc.id
         cidr_block="10.0.0.0/24"
         availability_zone     = "ap-south-1a"
          tags = {
               Name: "dev-subnet-1"
         }
   }
# creating a new subnet in the existing default vpc
   
   data "aws_vpc" "existing_vpc"{
         default = true

   }
   resource "aws_subnet" "dev-subnet-2"{
         vpc_id = data.aws_vpc.existing_vpc.id
         cidr_block="172.31.48.0/20"
         availability_zone     = "ap-south-1a"
          tags={
               Name: "dev-subnet-2"
         }
   }