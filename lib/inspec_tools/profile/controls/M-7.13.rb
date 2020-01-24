control "M-7.13" do
  title "7.13 Ensure Kubernetes Cluster is created with Alias IP ranges enabled
(Scored)"
  desc  "Google Cloud Platform Alias IP Ranges lets you assign ranges of
internal IP addresses as
    aliases to a virtual machine's network interfaces. This is useful if you
have multiple services
    running on a VM and you want to assign each service a different IP address.
    With Alias IPs ranges enabled, Kubernetes Engine clusters can allocate IP
addresses from a
    CIDR block known to Google Cloud Platform. This makes your cluster more
scalable and
    allows your cluster to better interact with other GCP products and
entities. Using Alias IPs
    has several benefits:  Pod IPs are reserved within the network ahead of
time, which prevents conflict with
    other compute resources.  The networking layer can perform anti-spoofing
checks to ensure that egress traffic
    is not sent with arbitrary source IPs.  Firewall controls for Pods can be
applied separately from their nodes.  Alias IPs allow Pods to directly access
hosted services without using a NAT gateway.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["CM-6", 4]]
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
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each cluster VPC native (using alias IP)   is Enabled under
Cluster
section
Using Command line:
To check Alias IP is enabled for an existing cluster, run the following command:
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.ipAllocationPolicy.useIpAliases'
The output of the above command should return  true , if VPC native (using
alias IP) is

nabled.
If VPC native (using alias IP) is disabled above command will return null.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Click on CREATE CLUSTER
3. Choose required name/value for cluster fields
4. Click on More
5. Set VPC native (using alias IP)   toEnabled
6. Click on Create
Using Command Line:
To enable Alias IP for an existing cluster, run the following command:
gcloud container clusters create [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
enable-ip-alias
"
end

