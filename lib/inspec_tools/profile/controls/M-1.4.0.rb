control "M-1.4.0" do
  title "1.4.0 or higher.
Enabling Container-Optimized OS provides the following benefits:  Run
Containers Out of the Box: Container-Optimized OS instances come pre-
installed with the Docker runtime and cloud-init. With a Container-Optimized OS
instance, you can bring up your Docker container at the same time you create
your
VM, with no on-host setup required.  Smaller attack surface:
Container-Optimized OS has a smaller footprint, reducing
your instance's potential attack surface.  Locked-down by default:
Container-Optimized OS instances include a locked-down
firewall and other security settings by default.  Automatic Updates:
Container-Optimized OS instances are configured to
automatically download weekly updates in the background; only a reboot is
necessary to use the latest updates.
Audit:
Using Console:
1. Go to Kubernetes GCP Console visiting
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each cluster nodes Container-Optimized OS (cos)   is selected
under
Node Pools section

Using Command line:
To check Node image type for an existing cluster nodes, run the following
command:
$ gcloud container node-pools describe [NODE_POOL] --cluster [CLUSTER_NAME] -
-zone [COMPUTE_ZONE] --format json | jq '.config.imageType'
The output of the above command returns COS, if Container-Optimized OS (cos)
used for
Node images.
Remediation:
Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select Kubernetes clusters for which Container-Optimized OS (cos) is not used
3. Click on EDIT button and SetNode image to Container-Optimized OS  under Node
Pools section
Using Command Line:
To enable Automatic node upgrades for an existing cluster's node pool, run the
following
command:
gcloud container clusters upgrade --image-type cos [CLUSTER_NAME] --zone
[COMPUTE_ZONE] --node-pool [POOL_NAME]
Impact:
Upgrade operation is long-running and will block other operations on the
cluster (including
delete) until it has run to completion.
Default Value:
Container-Optimized OS is the default option for a cluster node image.
References:
1. https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
2. https://cloud.google.com/container-optimized-os/docs/
Notes:
Container-Optimized OS is still under active development, and some of the
features and
limitations below are subject to change by Google, and functionality should
improve in
future versions.

CIS Controls:
Version 7
3.4 Deploy Automated Operating System Patch Management Tools
Deploy automated software update tools in order to ensure that the operating
systems
are running the most recent security updates provided by the software vendor.



7.10 Ensure Basic Authentication is disabled on Kubernetes Engine
Clusters (Scored)"
  desc  "Basic authentication allows a user to authenticate to the cluster with
a username and
    password and it is stored in plain text without any encryption. Disabling
Basic
    authentication will prevent attacks like brute force. Its recommended to
use either client
    certificate or IAM for authentication.
    When disabled, you will still be able to authenticate to the cluster with
client certificate or
    IAM. A client certificate is a base64-encoded public certificate used by
clients to
    authenticate to the cluster endpoint. Disable client certificate generation
to create a cluster
    without a client certificate.

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
  tag check: "Using Console:
1. Go to Kubernetes GCP Console visiting
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters, Click on EDIT button
and make sure for each cluster nodes Basic authentication  is set to Disabled
under Clusters section.
Using Command line:
To check Basic authentication status for an existing cluster nodes, run the
following
command:
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.masterAuth.password and .masterAuth.username'
The output of the above command should return  false , if Basic authentication
is disabled.
If Basic authentication is enabled above command will return true.
"
  tag fix: "Using Console:

1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select Kubernetes clusters for which Basic authentication is not used
3. Click on EDIT button and Set Basic authentication  toDisabled under Cluster
section
No CLI
"
end

