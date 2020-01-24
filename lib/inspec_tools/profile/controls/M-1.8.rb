control "M-1.8" do
  title "1.8 and later disable the legacy
authorization system by default, and thus role-based access control permissions
take effect
with no special action required.
References:
1. https://cloud.google.com/kubernetes-engine/docs/how-to/role-based-access-
control?hl=en_US
2. https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-container-
cluster
Notes:
On clusters running Kubernetes 1.6 or 1.7, Kubernetes service accounts have full
permissions on the Kubernetes API by default. To ensure that your role-based
access
control permissions take effect for a Kubernetes service account, you must
create or update
your cluster with the option --no-enable-legacy-authorization. This requirement
is
removed for clusters running Kubernetes version 1.8 or higher.
CIS Controls:
Version 7
4 Controlled Use of Administrative Privileges
Controlled Use of Administrative Privileges

16 Account Monitoring and Control
Account Monitoring and Control



7.4 Ensure Master authorized networks is set to Enabled on Kubernetes
Engine Clusters (Not Scored)"
  desc  "Authorized networks are a way of specifying a restricted range of IP
addresses that are
    permitted to access your container cluster's Kubernetes master endpoint.
Kubernetes
    Engine uses both Transport Layer Security (TLS) and authentication to
provide secure
    access to your container cluster's Kubernetes master endpoint from the
public internet.
    This provides you the flexibility to administer your cluster from anywhere;
however, you
    might want to further restrict access to a set of IP addresses that you
control. You can set
    this restriction by specifying an authorized network.
    By Enabling, Master authorized networks blocks untrusted IP addresses from
outside
    Google Cloud Platform and Addresses from inside GCP (such as traffic from
Compute
    Engine VMs) can reach your master through HTTPS provided that they have the
necessary
    Kubernetes credentials.
    Restricting access to an authorized network can provide additional security
benefits for
    your container cluster, including:  Better Protection from Outsider
Attacks: Authorized networks provide an additional
    layer of security by limiting external, non-GCP access to a specific set of
addresses
    you designate, such as those that originate from your premises. This helps
protect
    access to your cluster in the case of a vulnerability in the cluster's
authentication or
    authorization mechanism.  Better Protection from Insider Attacks:
Authorized networks help protect your
    cluster from accidental leaks of master certificates from your company's
premises.
    Leaked certificates used from outside GCP and outside the authorized IP
ranges--for
    example, from addresses outside your company--are still denied access.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: "Not Mapped"
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
1. https://console.cloud.google.com/kubernetes/list?

2. From the list of clusters,
make sure for each cluster 'Master authorized networks (beta)' is set to Enabled
under Cluster section
Using Command line:
To check Master authorized networks status for an existing cluster, run the
following
command,
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.masterAuthorizedNetworksConfig'
The output should return \"enabled\": true in set if Master authorized networks
is
Enabled.
If Master authorized networks disabled above command will return null set.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for which Master authorized networks is
disabled
3. Click on EDIT button and Set 'Master authorized networks (beta)' to Enabled
Using Command Line:
To enable Master authorized networks for an existing cluster, run the following
command:
gcloud container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
enable-master-authorized-networks
Along with this, you can list authorized networks using t--master-authorized-
networks flag which contains a list of up to 20 external networks that are
allowed to
connect to your cluster's Kubernetes master through HTTPS. You provide these
networks
as a comma-separated list of addresses in CIDR notation (such as
192.168.100.0/24).
"
end

