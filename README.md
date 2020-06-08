# Deploy a VPC Bastion Host using Schematics

## Customizing
If you want to change the default variables you may need access to the VPC API to pull latest stock images and profiles that are valid for the region you are deploying in to.

1. ### Launch Cloud Shell
You can launch your cloud shell instance by clicking on the [Cloud Shell](https://cloud.ibm.com/shell) link from portal navigation bar. 

![Cloud Shell Icon](https://dsc.cloud/quickshare/Shared-Image-2020-06-08-14-13-04.png)

2. ### Set Region and Generation
Once your Cloud Shell instance spins up you will need to set your default region and VPC generation. This code example has only been tested with VPC Gen 2 architecture. 

```shell
ibmcloud is target us-south
ibmcloud is target --gen 2
```

3. ### List images 
With the region and generation set we can now list out the available images. Using `jq` we can weed out older or deprecated images.

```shell


```



4. ### List Instance Profiles