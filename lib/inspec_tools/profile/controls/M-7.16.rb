control "M-7.16" do
  title "7.16 Ensure Private Google Access is set on Kubernetes Engine Cluster
Subnets (Scored)"
  desc  "Private Google Access enables your cluster hosts, which have only
private IP addresses, to
    communicate with Google APIs and services using an internal IP address
rather than an
    external IP address. External IP addresses are routable and reachable over
the Internet.
    Internal (private) IP addresses are internal to Google Cloud Platform and
are not routable
    or reachable over the Internet. You can use Private Google Access to allow
VMs without
    Internet access to reach Google APIs, services, and properties that are
accessible over
    HTTP/HTTPS.
    VPC networks and subnetworks provide logically isolated and secure network
partitions
    where you can launch GCP resources. When Private Google Access is enabled,
VM instances
    in a subnet can reach the Google Cloud and Developer APIs and services
without needing
    an external IP address. Instead, VMs can use their internal IP addresses to
access Google
    managed services. Instances with external IP addresses are not affected
when you enable
    the ability to access Google services from internal IP addresses. These
instances can still
    connect to Google APIs and managed services.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["CM-6", 4], ["SC-7", 4]]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil
  tag check: "Using Console:
1. Go to Kubernetes GCP Console visiting
https://console.cloud.google.com/kubernetes/list
2. From the list of clusters, for each clusters noteSubnet name
3. Go to VPC network GCP Console visiting
https://console.cloud.google.com/networking/networks/list
4. From the list of network subnets, choose noted subnet and
make sure subnet has Private Google access  is set tOn
Using Command line:
To get subnet name of the Cluster, run the following command:
gcloud beta container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE]
--format json | jq '.subnetwork'

The command will return you subnet name.
Note down the subnet name and mention the same name at following command which
will
check Private Google access status, run the following command:
gcloud compute networks subnets describe [SUBNET_NAME] --region [REGION] --
format json | jq '.privateIpGoogleAccess'
The output of the above command returns true, if Private Google access is set
on Cluster
subnetwork.
If Private Google access is set to Off above command will return false.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console visiting
https://console.cloud.google.com/kubernetes/list
2. From the list of clusters, for each clusters noteSubnet name
3. Go to VPC network GCP Console visiting
https://console.cloud.google.com/networking/networks/list
4. Click noted subnet, TheSubnet details  page is displayed
5. Click on Edit button
6. Set Private Google access  to On
7. Click on Save
Using Command Line:
To set Private Google access for a network subnet, run the following command:
gcloud compute networks subnets update [SUBNET_NAME] --region [REGION] --
enable-private-ip-google-access
"
end

