control "M-7.8" do
  title "7.8 Ensure Automatic node upgrades is enabled on Kubernetes Engine
Clusters nodes (Scored)"
  desc  "Node auto-upgrades help you keep the nodes in your cluster or node
pool up to date with
    the latest stable version of Kubernetes. Auto-Upgrades use the same update
mechanism as
    manual node upgrades.
    Node pools with auto-upgrades enabled are automatically scheduled for
upgrades when a
    new stable Kubernetes version becomes available. When the upgrade is
performed, the
    node pool is upgraded to match the current cluster master version. Some
benefits of using
    enabling auto-upgrades are:  Lower management overhead: You don't have to
manually track and update to the
    latest version of Kubernetes.  Better security: Sometimes new binaries are
released to fix a security issue. With
    auto-upgrades, Kubernetes Engine automatically ensures that security
updates are
    applied and kept up to date.  Ease of use: Provides a simple way to keep
your nodes up to date with the latest
    Kubernetes features.

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
1. Go to Kubernetes GCP Console visiting
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each clusterAutomatic node upgrades   is set to Enabled under Node
Pools section
Using Command line:
To check existence of Automatic node upgrades for an existing cluster's node
pool, run the
following command,
$ gcloud container node-pools describe [NODE_POOL] --cluster [CLUSTER_NAME] -
-zone [COMPUTE_ZONE] --format json | jq '.management'

Ensure the output of the above command has JSON key attributeautoUpgrade set
totrue
{
\"autoUpgrade\": true
}
If autoUpgrade is disabled above command output will not contain the
autoUpgrade entry.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for which Automatic node upgrades is
disabled
3. Click on EDIT button and SetAutomatic node upgrades  to Enabled
Using Command Line:
To enable Automatic node upgrades for an existing cluster's node pool, run the
following
command:
gcloud container node-pools update [NODE_POOL] --cluster [CLUSTER_NAME] --
zone [COMPUTE_ZONE] --enable-autoupgrade
"
end

