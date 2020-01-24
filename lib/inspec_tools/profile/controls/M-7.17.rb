control "M-7.17" do
  title "7.17 Ensure default Service account is not used for Project access in
Kubernetes Clusters (Scored)"
  desc  "A service account is an identity that an instance or an application
can use to run API
    requests on your behalf. This identity is used to identify applications
running on your
    virtual machine instances to other Google Cloud Platform services. By
default, Kubernetes
    Engine nodes are given the Compute Engine default service account. This
account has
    broad access by default, making it useful to a wide variety of
applications, but it has more
    permissions than are required to run your Kubernetes Engine cluster.
    You should create and use a minimally privileged service account to run
your Kubernetes
    Engine cluster instead of using the Compute Engine default service account.
If you are not
    creating a separate service account for your nodes, you should limit the
scopes of the node
    service account to reduce the possibility of a privilege escalation in an
attack. Kubernetes
    Engine requires, at a minimum, the service account to have the
monitoring.viewer,
    monitoring.metricWriter, and logging.logWriter roles. This ensures that
your default
    service account does not have permissions beyond those necessary to run
your cluster.
    While the default scopes are limited, they may include scopes beyond the
minimally
    required scopes needed to run your cluster.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["RA-5", 4], ["AC-2", 4]]
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
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each clusterService account  is not set tCompute Engine default
service account  under Permissions drop-down
Using Command line:
To check which Service account is set for an existing cluster, run the
following command:
$ gcloud container node-pools describe [NODE_POOL] --cluster [CLUSTER_NAME] -
-zone [COMPUTE_ZONE] --format json | jq '.config.serviceAccount'

The output of the above command will return  default if default Service account
is used for
Project access.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Click on CREATE CLUSTER
3. Choose required name/value for cluster fields
4. Click on More
5. Choose Service account  which has the least privilege under Project access
section,
Instead of defaultCompute Engine default service account
NOTE: The default scopes for the nodes in Kubernetes Engine are
devstorage.read_only  ,
logging.write ,monitoring ,service.management.readonly   ,servicecontrol  , and
trace.append . If you are accessing private images in Google Container
Registry, the
minimally required scopes are only logging.write  ,monitoring , and
devstorage.read_only  .
You can configure a service account with minimal privileges and assign the same.
6. Click on Create
Using Command Line:
To create a new node pool with service account with least privilege:, run the
following
command:
gcloud container node-pools create [NODE_POOL] --service-
account=[SA_NAME]@[PROJECT_ID].iam.gserviceaccount.com\" --
cluster=[CLUSTER_NAME] --zone [COMPUTE_ZONE]
``
"
end

