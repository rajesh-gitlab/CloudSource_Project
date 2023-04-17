# CloudSource_Project

# Steps to provisoion cloud server using Terraform:

- Identify the Provider, preferred AWS as example
- Provide Access and Secret Keys from the provider.
- I have chosen my own public key to access the server.
- Create a AWS instance "rajesh-tokala" using resource name "rajeshtokala"
- Allow SSH and HTTPS traffic by ingress condition.
- Finally, obtain Public IP from the spinned up VM.

For running the terraform script, use below commands
terraform init
terraform plan
terraform apply


# Ansible Playbook script execution:

- Create an Inventory file with the Public IP address obtained.
- For using DNS, we can add IP address in /etc/hosts. For example:  127.0.0.1     rajeshtokala.com
- And update the same DNS to the inventory for the playbook to use.
- Have declared few variables, which would help in reusing in the playbook.
- As requested, the playbook performs sequence of operations:
    - Copy the given files into local first
    - Create a directory
    - Copy the the shell script to desired path
    - Rename the file 
    - Copy the config file to desired path
    - Update the token value using "regexp" from the variable defined
    - Finally execute the shell script
 
 Command to run the playbook
 ansible-playbook Configuration_Playbook.yml -i inventory
