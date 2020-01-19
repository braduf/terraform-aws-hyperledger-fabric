# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A HYPERLEDGER FABRIC ORDERER AND ANCHOR AND INTERNAL PEER NODES FOR AN ORGANIZATION IN AWS.
# This is an example of how to use the orderer and peer modules to deploy the Hyperledger Fabric components for an 
# organization in AWS.
# ---------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}
