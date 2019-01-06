## NYUAD Training for External Participants on AWS

## Cluster Management / Deployment

We are using [cfncluster](https://cfncluster.readthedocs.io/en/latest/index.html) to manage and deploy training infrastructure.
CfnCluster requires an AWS account, and at least 1 ec2-keypair key.

Our particular setup also requires additional storage, which must be linked to the same VPC as the cluster.

### Install and Configure CfnCluster

See the docs - [installation](https://cfncluster.readthedocs.io/en/latest/getting_started.html#installing-cfncluster)

Configuration - [configuration](https://cfncluster.readthedocs.io/en/latest/getting_started.html#configuring-cfncluster)


Additional Configuration - [additional configuration](https://cfncluster.readthedocs.io/en/latest/configuration.html)

Our setup: (in ~/.cfncluster/config)

```
[cluster default]
key_name = amazon-linux-2-ami
vpc_settings = public
scheduler = slurm
### 32 GB
compute_instance_type = t3.2xlarge
ephemeral_dir = /data
```


### Spin up a cluster

The command to create a cluster is `cfncluster create name-of-the-cluster`
```
➜  nyuad-training-aws git:(develop) cfncluster create my-test-cluster
Beginning cluster creation for cluster: my-test-cluster
Creating stack named: cfncluster-my-test-cluster
Status: MasterServer - CREATE_IN_PROGRESS
Status: cfncluster-my-test-cluster - CREATE_COMPLETE
MasterPublicIP: 35.175.9.211
ClusterUser: ec2-user
MasterPrivateIP: 172.31.25.130
```

SSH to the cluster using the public IP address and the corresponding ec2 keypair.

`ssh -i ~/.ssh/amazon-linux-2-ami.pem ec2-user@35.175.9.211`

### Mounting file storage

Create EFS File storage and install the utils on the ec2 instance.

This step can take awhile.

```
sudo yum install -y amazon-efs-utils
##fs-NNNNNN is the EFS ID
sudo mkdir -p /scratch
sudo mount -t efs fs-1960cef8:/ /scratch
```

The security group associated with the storage MUST allow for SSH and NFS connectivity, which is not there by default.

[Security Groups Mount NFS](https://docs.aws.amazon.com/efs/latest/ug/accessing-fs-create-security-groups.html)


## Resources
[Deploy an Elastic HPC Cluster](https://aws.amazon.com/getting-started/projects/deploy-elastic-hpc-cluster/)
