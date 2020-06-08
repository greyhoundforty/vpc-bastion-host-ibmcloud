# Deploy a VPC Bastion Host using Schematics

## Customizing
If you want to change the default variables you may need access to the VPC API to pull latest stock images and profiles that are valid for the region you are deploying in to.

1. ### Launch Cloud Shell
You can launch your cloud shell instance by clicking on the [Cloud Shell](https://cloud.ibm.com/shell) link from portal navigation bar. 

![Cloud Shell Icon](https://dsc.cloud/quickshare/Shared-Image-2020-06-08-14-13-04.png)

2. ### Set Region and Generation
Once your Cloud Shell instance spins up you will need to set your default region and VPC generation. This code example has only been tested with VPC Gen 2 architecture. 

```shell
◲ ibmcloud is target us-south
◲ ibmcloud is target --gen 2
```

3. ### List images 
With the region and generation set we can now list out the available images. 

```shell
◲ ibmcloud is images --visibility public

```
Using the built-in `jq` utility we can filter by architecture and availability.

```shell
◲ ibmcloud is images --visibility public --json | jq -r '.[] | select(.status=="available") | select(.operating_system.architecture=="amd64") | .name'
ibm-centos-7-6-minimal-amd64-2
ibm-debian-9-12-minimal-amd64-1
ibm-redhat-7-6-amd64-sap-applications-1
ibm-redhat-7-6-amd64-sap-hana-1
ibm-redhat-7-6-minimal-amd64-1
ibm-ubuntu-16-04-5-minimal-amd64-1
ibm-ubuntu-18-04-1-minimal-amd64-1
ibm-windows-server-2012-full-standard-amd64-3
ibm-windows-server-2012-r2-full-standard-amd64-3
ibm-windows-server-2016-full-standard-amd64-3
```

4. ### List Instance Profiles

```shell
◲ ibmcloud is in-prs
```