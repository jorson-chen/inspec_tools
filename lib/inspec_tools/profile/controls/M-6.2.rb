control "M-6.2" do
  title "6.2 Activate audit logging
Ensure that local logging has been enabled on all systems and networking
devices.



7.3 Ensure Legacy Authorization is set to Disabled on Kubernetes Engine
Clusters (Scored)"
  desc  "In Kubernetes, authorizers interact by granting a permission if any
authorizer grants the
    permission. The legacy authorizer in Kubernetes Engine grants broad,
statically defined
    permissions. To ensure that RBAC limits permissions correctly, you must
disable the legacy
    authorizer. RBAC has significant security advantages, can help you ensure
that users only
    have access to cluster resources within their own namespace and is now
stable in
    Kubernetes.
    Enable Legacy Authorization for in-cluster permissions that support
existing clusters or
    workflows. Disable legacy authorization for full RBAC support for
in-cluster permissions. In
    Kubernetes, RBAC is used to grant permissions to resources at the cluster
and namespace
    level. RBAC allows you to define roles with rules containing a set of
permissions.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: nil
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
make sure for each cluster 'Legacy Authorization' is set to Disabled under
Cluster
section
Using Command line:
To check Legacy Authorization status for an existing cluster, run the following
command:
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.legacyAbac'
The output should return null set({})  if Legacy Authorization is Disabled.
If Legacy Authorization is enabled above command will return true value set to
Enabled.
"
  tag fix: "Using Console:

1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for which Legacy Authorization is enabled
3. Click on EDIT button and Set 'Legacy Authorization' to Disabled
Using Command Line:
To disable Legacy Authorization for an existing cluster, run the following
command:
gcloud container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE] --no-
enable-legacy-authorization
"
end

