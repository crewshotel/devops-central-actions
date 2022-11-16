
# linux command line - set variables 
awsid=$(head -n 1 /dockerfile_support/eks_mgmt_id.txt)
awssecret=$(head -n 1 /dockerfile_support/eks_mgmt_secret.txt)
awsregion='us-east-2'
awseksclustername='eks-cluster-01'

echo "$awsid"
echo "$awssecret"
echo "$awsregion"
echo "$awseksclustername"

# docker build statement
docker build -t admin-eks-cluster-01 -f dockerfile-eks-cluster-01 --build-arg AWSID=$awsid --build-arg AWSSECRET=$awssecret --build-arg AWSREGION=$awsregion --build-arg AWSEKSCLUSTERNAME=$awseksclustername .


# docker scp command for copy dockerfiles - folder and all contents to ec2 instance
scp -i Working/aws/ssh_keys/g360-github-runners.pem -r /Users/rodneynewberry/Working/aws/greenfield/github-runners/dockerfiles ec2-user@10.7.1.207:~/working/docker
