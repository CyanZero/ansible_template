#A practical Ansible template

This is a practical Ansible template that can be used immediately to support different stages and multiple cloud

## Key features
* Segregate different ENV
* Flexiability to support multiple applications
* Multi-cloud supports (GCP, AWS)

## Configuration and Pre-requisite
* Python 2.7+
* Ansible 2.7

## How to use
### Verification of setup
*Make sure the inventory/hosts are config with valid IPs first*
#### Pull out the code first
```git clone git@github.com:CyanZero/ansible_template.git```
#### Ping some servers to check connectivity
```ansible -i local/ tag_web-server -m ping```

### Run Ansible playbook
#### Dry run
```ansible-playbook -i local/ playbooks/server_conf.yml --diff --check```
#### Confirm the configuration changes and trigger the ansible-playbook tasks
```ansible-playbook -i local/ playbooks/server_conf.yml --diff```

## Ansible structure
*  ansible
	*  local
		*  group_vars
			```all```
		*  inventory
			```hosts```
	*  dev_gce
		*  group_vars
			```all```
		*  inventory
			```hosts```
			```gce.py```
			```dev_gce.ini```
	*  staging
	*  prod
	*  playbooks
		```site.yml```
		```server_conf.yml```
		*  roles
			*  tasks
			```main.yml```
			*  templates
			```syslog.conf.tpl```
			*  handlers
			```handlers.yml```
		*  common
		*  java
		*  nginx
		*  shared

### (Optional) GCP inventory
#### Configure the GCP access key in gce.ini
* A GCP service account with miminum Compute Engine Editor role
* gce_service_account_email_address = ${email_address}
* gce_service_account_pem_file_path = ${path to gserviceaccount.json}
* gce_project_id = PROJECT NAME
#### Configure gce.ini location to load GCP VMs into inventory
```export GCE_INI_PATH=${path to gce.ini}```
###Verify setup and inventory
Get the inventory list
```./dev/inventory/gce.py```

### Practical tips
*Use differnt folder for different ENV, e.g. local, dev and prod*
*Roles are shared common tasks*
*Assign multiple roles to a host*
*Host is a set of instance group*
*Use site.yml to run multple playbooks*
*Load tasks dynamically by passing in variablies*