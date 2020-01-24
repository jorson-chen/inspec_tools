control "M-1.7" do
  title "1.7 and higher. The Kubernetes web UI is disabled by default in
Kubernetes Engine
1.10 and higher.
References:
1. https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster
CIS Controls:
Version 7
4 Controlled Use of Administrative Privileges
Controlled Use of Administrative Privileges



7.7 Ensure `Automatic node repair` is enabled for Kubernetes Clusters
(Scored)"
  desc  "Kubernetes Engine's node auto-repair feature helps you keep the nodes
in your cluster in a
    healthy, running state. When enabled, Kubernetes Engine makes periodic
checks on the
    health state of each node in your cluster. If a node fails consecutive
health checks over an
    extended time period, Kubernetes Engine initiates a repair process for that
node. If you
    disable node auto-repair at any time during the repair process, the
in-progress repairs are
    not cancelled and still complete for any node currently under repair.
    Kubernetes Engine uses the node's health status to determine if a node
needs to be
    repaired. A node reporting a Ready status is considered healthy. Kubernetes
Engine
    triggers a repair action if a node reports consecutive unhealthy status
reports for a given
    time threshold. An unhealthy status can mean:  A node reports a NotReady
status on consecutive checks over the given time
    threshold (approximately 10 minutes).  A node does not report any status at
all over the given time threshold
    (approximately 10 minutes).  A node's boot disk is out of disk space for an
extended time period (approximately
    30 minutes).
    You can enable node auto-repair on a per-node pool basis. When you create a
cluster, you
    can enable or disable auto-repair for the cluster's default node pool. If
you create additional
    node pools, you can enable or disable node auto-repair for those node
pools, independent
    of the auto-repair setting for the default node pool. Kubernetes Engine
generates an entry
    in its operation logs for any automated repair event. You can check the
logs by using the
    gcloud container operations list command.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["CP-9", 4]]
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
  tag check: "From Console
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?

2. From the list of clusters, make sure for each clusAutomatic node repair  is
set to
Enabled under `Node Pools'.
Using Command line:
gcloud container node-pools describe default-pool --cluster timos-cluster --
zone us-central1-a --format json | jq '.management'
Ensure the output of the above command has JSON key attribute autoRepair set
totrue
{
\"autoRepair\": true
}
"
  tag fix: "From Console
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for whichAutomatic node repair  is
disabled
3. Click on EDIT button and Set Automatic node repair  to Enabled
Using Command line:
To enable Automatic node repair  for an existing cluster winode pool , run the
following command:
gcloud container node-pools update [POOL_NAME] --cluster [CLUSTER_NAME] --
zone [COMPUTE_ZONE] --enable-autorepair
Note: Node auto-repair is only available for nodes that use Container-Optimized
OS as their
node image. Node auto-repair is not available on Alpha Clusters.
"
end

