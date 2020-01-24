control "M-5.1" do
  title "5.1 Establish Secure Configurations
Maintain documented, standard security configuration standards for all
authorized
operating systems and software.
5.4 Deploy System Configuration Management Tools
Deploy system configuration management tools that will automatically enforce and
redeploy configuration settings to systems at regularly scheduled intervals.



7.15 Ensure Kubernetes Cluster is created with Private cluster enabled
(Scored)"
  desc  "A private cluster is a cluster that makes your master inaccessible
from the public internet.
    In a private cluster, nodes do not have public IP addresses, so your
workloads run in an
    environment that is isolated from the internet. Nodes have addressed only
in the private
    RFC 1918 address space. Nodes and masters communicate with each other
privately using
    VPC peering.
    With a Private cluster enabled, VPC network peering gives you several
advantages over
    using external IP addresses or VPNs to connect networks, including:
Network Latency: Public IP networking suffers higher latency than private
    networking.  Network Security: Service owners do not need to have their
services exposed to the
    public Internet and deal with its associated risks.  Network Cost: GCP
charges egress bandwidth pricing for networks using external
    IPs to communicate even if the traffic is within the same zone. If however,
the
    networks are peered they can use internal IPs to communicate and save on
those
    egress costs. Regular network pricing still applies to all traffic.

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
make sure for each cluster Private cluster  is Enabled under Cluster section
Using Command line:
To check Private cluster is enabled for an existing cluster, run the following
command,
gcloud beta container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE]
--format json | jq '.privateCluster'

The output of the above command should return true , if the Private cluster is
enabled.
If the Private cluster is disabled above command will return null.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Click on CREATE CLUSTER
3. Choose required name/value for cluster fields
4. Click on More
5. From the Private cluster drop-down menu, select Enabled
6. Verify thatVPC native (alias IP)  is set tEnabled
7. Set Master IP range  to as per your required IP range
8. Click on Create
Using Command Line:
To create cluster with Private cluster enabled, run the following command:
gcloud beta container clusters create [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
private-cluster --master-ipv4-cidr 172.16.0.16/28 --enable-ip-alias --create-
subnetwork \"\"
NOTE: When you create a private cluster, you must specify a /28 CIDR range for
the VMs
that run the Kubernetes master components. You also need to enable Alias IPs.
The range
you specify for the masters must not overlap with any subnet in your cluster's
VPC.
"
end

