# Terraform Basics

This guide covers essential Terraform commands and configurations, helping you manage infrastructure efficiently. From initialization to managing state and destroying resources, this document explains how to use Terraform for infrastructure as code.

## 1. Terraform Basics

### `terraform init`
**Purpose**: Initializes the Terraform environment, downloads provider plugins, and sets up the backend.

**Example**:
```bash
terraform init
```
**Explanation**: Run this command once per new configuration or whenever you add new providers. It prepares the environment for deployment.

### `terraform fmt`

Purpose: Formats the Terraform configuration files to a standard style.

Example:
```bash
terraform fmt
```
**Explanation**: Helps keep the code consistent and readable.

## 2. Terraform Plan and Apply
### `terraform plan`

Purpose: Shows a preview of the actions Terraform will take to reach the desired state.

Example:
```bash
terraform plan
```
**Explanation**: Useful for reviewing changes before they’re applied.

### `terraform apply`

**Purpose**: Executes the plan and applies changes to reach the desired state.

Example:
```bash
terraform apply
```
**Explanation**: Applies the changes described in your Terraform configuration to your infrastructure.

### `terraform apply -auto-approve`

**Purpose**: Skips the interactive approval prompt, automating deployments.

Example:
```bash
terraform apply -auto-approve
```
**Explanation**: Useful in CI/CD pipelines, but should be used cautiously.

## 3. Terraform Variables and Outputs
Defining Variables in `variables.tf`

Example:
```hcl
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t2.micro"
}
```
***Explanation**: Declares a variable with a default value that can be overridden in different environments.
### `terraform output`

**Purpose**: Shows the output values defined in the configuration after applying.

Example:
```hcl
terraform output
```
**Explanation**: Useful for retrieving information like IPs or resource IDs after provisioning.

### Defining Outputs in `outputs.tf`

Example:
```hcl
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
```
**Explanation**: Outputs provide an easy way to retrieve and share values across different Terraform configurations.

## 4. Managing the State
### `terraform show`

**Purpose**: Displays details about the current state.

Example:
```bash
terraform show
```
**Explanation**: Useful for debugging and seeing what’s currently deployed.

### `terraform state list`

**Purpose**: Lists all resources in the state.

Example:
```bash
terraform state list
```
**Explanation**: Helps to see all resources managed by Terraform, especially in large configurations.

### `terraform state show <resource>`

**Purpose**: Shows details of a specific resource from the state.

Example:
```bash
terraform state show aws_instance.example
```
**Explanation**: Provides detailed information about a particular resource in the state.

### 'terraform state rm <resource>``

**Purpose**: Removes a resource from the Terraform state.

Example:
```bash
terraform state rm aws_instance.example
```
**Explanation**: Useful for managing drift or manually removing resources without deleting them in real infrastructure.

## 5. Destroying Resources
### `terraform destroy`

**Purpose**: Destroys the infrastructure defined in the configuration.

Example:
```bash
terraform destroy
```
### `terraform destroy -target=<resource>``

**Purpose**: Destroys a specific resource in the configuration.

Example:
```bash
terraform destroy -target=aws_instance.example
```
**Explanation**: Limits the destruction to a single resource, helpful in scenarios where only specific resources need to be removed.

## 6. Workspaces
### `terraform workspace new <workspace_name>`

**Purpose**: Creates a new workspace.

Example:
```bash
terraform workspace new dev
```
**Explanation**: Workspaces allow for isolated instances of infrastructure, useful for managing multiple environments.

### `terraform workspace list`

**Purpose**: Lists all available workspaces.

Example:
```bash
terraform workspace list
```
**Explanation**: Shows all workspaces to understand available environments.

### `terraform workspace select <workspace_name>`
**Purpose**: Switches to a specific workspace.

Example:
```bash
terraform workspace select dev
```
**Explanation**: Switches environments to prevent accidental resource changes across different workspaces.