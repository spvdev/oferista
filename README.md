# Offerista Terraform Project

This repository contains the Terraform configurations for managing the infrastructure of the Offerista project. Each directory represents a different component of the infrastructure setup and needs to be initialized in the numbered order.

### Benefits

* **Scalability** : 
    - The infrastructure can easily be scaled up or down by adjusting the configuration and reapplying Terraform.
* **Consistency** : 
    - The use of Terraform ensures that infrastructure changes are applied consistently and reproducibly.
* **Modularity** :
    - Each component is defined in a separate directory, making it easier to manage and understand the infrastructure.
* **Automation** : 
    - Infrastructure provisioning is automated, reducing the potential for human error and speeding up deployment times.
* **Version Control** : 
    - Infrastructure code can be version controlled, enabling tracking of changes over time and collaboration among team members.
 

## Project Structure

```
.
├── 1_init
├── 2_vpc
├── 3_subnets
├── 4_gateways
├── 5_routing_tables
├── 6_security_groups
├── 7_load_balance
└── 8_ecs
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0.0 or later
- AWS CLI configured with appropriate permissions

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/spvdev/oferista.git
cd oferista
```

### Initialize the Project

```bash
terraform init
```

### Plan the Infrastructure Changes

```bash
terraform plan
```

### Apply the Changes

```bash
terraform apply
```

### Destroy the Infrastructure

```bash
terraform destroy
```

## Module Details

### 1. Initialization (`1_init`)

Contains backend configuration for remote state management.

### 2. VPC (`2_vpc`)

Defines the Virtual Private Cloud (VPC) setup.

### 3. Subnets (`3_subnets`)

Defines public and private subnets.

### 4. Gateways (`4_gateways`)

Sets up Internet and NAT gateways.

### 5. Routing Tables (`5_routing_tables`)

Configures routing tables for the subnets.

### 6. Security Groups (`6_security_groups`)

Creates security groups for various resources.

### 7. Load Balancer (`7_load_balance`)

Configures an Application Load Balancer (ALB).

### 8. ECS (`8_ecs`)

Defines ECS cluster, services, and tasks.

## Remote State Management

This project uses AWS S3 and DynamoDB for remote state management. Ensure the backend configuration in `1_init` is correct and the S3 bucket and DynamoDB table exist.


###
[DEMO URL with default NGINX page hosted](http://alb-on-prem-interconnect-1582748921.eu-central-1.elb.amazonaws.com)
