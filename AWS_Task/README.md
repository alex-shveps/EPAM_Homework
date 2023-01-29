# Homework AWS Cloud Basic

####  7. Review Getting Started with Amazon EC2. Log Into Your AWS Account, Launch, Configure, Connectand Terminate Your Instance. Do not use Amazon Lightsail. It is recommended to use the t2 or t3.micro instance and the CentOS operating system.

![](red_hat_EC2.png)
---
![](aws_red_hat.png)
---

####  8. Create a snapshot of your instance to keep as a backup.
---
![](snapshots_red_hat_complete.png)
---

####  9. Create and attach a Disk_D (EBS) to your instance to add more storage space. Create and save some file on Disk_D.
---
Create Disk_d
![](create_Disk_d.png)
---

Attach Disk_D to my instance
````
lsblk
````
![](attached_disk.png)
---
````
sudo fdisk /dev/xvdf
n
p
1
2048
2097151
w
sudo mkfs -t ext4 /dev/xvdf
mkdir /home/ec2-user/disk_d
sudo mount /dev/xvdf /home/ec2-user/disk_d/
````
CreateCreate and save some file on Disk_D
![](create_file_disk_d.png)
---
####  10. Launch the second instance from backup.
![](lounch_new_incstace.png)
---
####  11. Detach Disk_D from the 1st instance and attach disk_D to the new instance.
Unmount Disk_D
````
sudo /home/ec2-user/disk_d
````
![](umount_disk.png)

Attach Disk_D to new instance
````
mkdir /home/ec2-user/disk_d
sudo mount /dev/xvdf /home/ec2-user/disk_d/
ls -al /disk_d
````
![](attached_disk_chek_file.png)
---

####  12. Register the domain name *.PP.UA and use it.

![](domain_pp_ua.png)
---

####  13. Launch and configure a WordPress instance with Amazon Lightsail.

Connect to instance and check password:
````
cat $HOME/bitnami_application_password
````

Enter a WordPress.

![](enter_wp.png)

Delete a WordPress instance.
---

####  14. Review the 10-minute Store and Retrieve a File. Repeat, creating your own repository.

Create S3 buckets.

Upload some file to buckets:

![](upload_s3_bucket.png)
---

Create Dir "log" in s3 bucket:
![](create_dir_s3.png)
---

####  15. Batch upload files to the cloud to Amazon S3 using the AWS CLI.Create a user AWS IAM, configure CLI AWS and upload any files to S3.

Create a user AWS IAM:

![](iam_user.png)
---

Install  AWS CLI.
Start PowerShell and write credentials.

![](conncet_cli_aws.png)
---

Write some command to use S3:
````
aws s3 mb s3://my-first-backup-bucket-alex-shvets-lol
````
---
![](create_S3_cli.png)
---
Delete s3 bucket:
````
aws s3api delete-bucket --bucket my-first-backup-bucket-alex-shvets-lol --region eu-central-1![]
````
(delete_s3.png)
---
Copy some file in another s3:
````
aws s3 cp "C:\Users\kazza\Downloads\squad.png"  s3://myfirstbucket.alex/
````
![](add_file_cli.png)
---









