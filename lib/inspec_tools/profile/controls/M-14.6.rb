control "M-14.6" do
  title "14.6 Protect Information through Access Control Lists
Protect all information stored on systems with file system, network share,
claims,
application, or database specific access control lists. These controls will
enforce the
principle that only authorized individuals should have access to the
information based on
their need to access the information as a part of their responsibilities.



7.5 Ensure Kubernetes Clusters are configured with Labels (Not Scored)"
  desc  "A cluster label is a key-value pair that helps you organize your
Google Cloud Platform
    resources, such as clusters. You can attach a label to each resource, then
filter the resources
    based on their labels. Information about labels is forwarded to the billing
system, so you
    can break down your billing charges by the label.
    Configured Labels can be used to organize and to select subsets of objects.
Labels can be
    attached to objects at creation time and subsequently added and modified at
any time. Each
    object can have a set of key/value labels defined. Each Key must be unique
for a given
    object. Labels enable users to map their own organizational structures onto
system objects
    in a loosely coupled fashion, without requiring clients to store these
mappings. Labels can
    also be used to apply specific security settings and 'auto configure'
objects at creation.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["AC-6", 4]]
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
1. Ghttps://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each cluster the Key and value pair is set under Clusters 'Labels'
section
Using Command line:
To check for the existence of Labels for an existing cluster, run the following
command,
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.resourceLabels'
The output should return Key and value pairs in set if Labels are configured.
If Labels are not configured above command will return null set.
"
  tag fix: "Using Console:

1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for which Master authorized networks is
disabled
3. Click on EDIT button and Set 'Master authorized networks (beta)' to Enabled
Using Command Line:
To configure Labels for an existing cluster, run the following command:
gcloud container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE]      --
update-labels [Key]=[Value]
"
end

