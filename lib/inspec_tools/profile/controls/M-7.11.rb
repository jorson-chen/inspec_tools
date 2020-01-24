control "M-7.11" do
  title "7.11 Ensure Network policy is enabled on Kubernetes Engine Clusters
(Scored)"
  desc  "A network policy is a specification of how groups of pods are allowed
to communicate with
    each other and other network endpoints. NetworkPolicy resources use labels
to select pods
    and define rules which specify what traffic is allowed to the selected
pods. The Kubernetes
    Network Policy API allows the cluster administrator to specify what pods
are allowed to
    communicate with each other.
    By default, pods are non-isolated; they accept traffic from any source.
Pods become isolated
    by having a NetworkPolicy that selects them. Once there is any
NetworkPolicy in a
    namespace selecting a particular pod, that pod will reject any connections
that are not
    allowed by any NetworkPolicy. (Other pods in the namespace that are not
selected by any
    NetworkPolicy will continue to accept all traffic.)

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
make sure for each clusterNetwork policy for master  and Network policy for
nodes are Enabled under Cluster section
Using Command line:
To check Network policy is enabled for an existing cluster, run the following
command,
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.networkPolicy'
Ensure the output of the above command has JSON key attribute enabled set ttrue
{
\"enabled\": true
}

If Network policy is disabled above command output will return null.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select Kubernetes clusters for which Network policy is disabled
3. Click on EDIT button and SetNetwork policy for master  and Network policy for
nodes toEnabled under Cluster section
Using Command Line:
To enable Network policy for an existing cluster, run the following command:
gcloud container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
enable-network-policy
"
end

