# AWS Hello World

Terraform module which creates a hello world EC2 Instance on AWS.

## Usage

```hcl
module "hello-world" {
    source = "app.terraform.io/mattspahr-sandbox/hello-world/aws"
    version = "1.0.1"
}
```