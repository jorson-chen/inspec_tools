control "M-7.18" do
  title "7.18 Ensure Kubernetes Clusters created with limited service account
Access scopes for Project access (Scored)"
  desc  "Access scopes are the legacy method of specifying permissions for your
instance. Before the
    existence of IAM roles, access scopes were the only mechanism for granting
permissions to
    service accounts. By default, your node service account has access scopes.
    If you are not creating a separate service account for your nodes, you
should limit the
    scopes of the node service account to reduce the possibility of a privilege
escalation in an
    attack. This ensures that your default service account does not have
permissions beyond
    those necessary to run your cluster. While the default scopes are limited,
they may include
    scopes beyond the minimally required scopes needed to run your cluster.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["AC-2", 4]]
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
  tag check: "Using Command line:
To check Access scopes set for an existing cluster, run the following command:
gcloud container node-pools describe [NODE_NAME] --cluster [CLUSTER_NAME] --
zone [COMPUTE_ZONE] --format json | jq '.config.oauthScopes'
The output of the above command will return array set access scopes. Make sure
you have
provided limited required scopes for each node clusters.
If you are accessing private images in Google Container Registry, the minimally
required
scopes are only logging.write ,monitoring , anddevstorage.read_only  .
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Click on CREATE CLUSTER
3. Choose required name/value for cluster fields
4. Click on More

5. Under Access scopes  select Set access for each API   and choose minimal API
access as you desired
6. Click on Create
Using Command Line:
To create a cluster with least privileged/Custom Access scopes:, run the
following
command:
gcloud container clusters create [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
scopes=[CUSTOM_SCOPES]
NOTE: The default scopes for the nodes in Kubernetes Engine are
devstorage.read_only  ,
logging.write  ,monitoring ,service.management.readonly   ,servicecontrol  , and
trace.append . When setting scopes, these are specified as gke-default . If you
are
accessing private images in Google Container Registry, the minimally required
scopes are
only logging.write  ,monitoring , anddevstorage.read_only  .
"
end

