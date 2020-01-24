control "M-0.0.0.0" do
  title "0.0.0.0 or /0
Using Command-line:
1. List all MySql database Instances
gcloud MySql instances list --filter='DATABASE_VERSION:MYSQL*'
2. For Every MySql Database Instance Listed above,
gcloud MySql users list --instance [INSTANCE_NAME]
User root should not have host configured to% (any) or0.0.0.0 or/0

Remediation:
Using Command-line:
Note: We haven't come across any setting provided by Google cloud console or
gcloud
utility to update host for a root user. Below remediation uses myMySql-client
binary to set
the host for root user. Similarly, for PostgreMySql instance,
1. Login to MySql database instance from  authorized network
mysql connect -u root [INSTANCE_ADRESS]
2. Set host for root user
UPDATE MySql.user SET Host=[Host_name/IP] WHERE User='root';
Impact:
Only configured hosts will be able access MySql database Instance with root
privileges.
Default Value:
By default,root access to MySql Database Instance is allowed for any Host.
References:
1. https://cloud.google.com/MySql/docs/MySql/create-manage-users
Notes:
This recommendation is only applicable to MySQL database Instances. As of now
for
PostgreSQL, google cloud console/gcloud utility does not offer any relevant
setting/option.
Apart from default root if there are any other database users with
administrative
privileges, those should be considered for this recommendation as well.
CIS Controls:
Version 7
4 Controlled Use of Administrative Privileges
Controlled Use of Administrative Privileges
14.6 Protect Information through Access Control Lists
Protect all information stored on systems with file system, network share,
claims,
application, or database specific access control lists. These controls will
enforce the

principle that only authorized individuals should have access to the
information based on
their need to access the information as a part of their responsibilities.

7 Kubernetes Engine
This section covers recommendations addressing Google Kubernetes Engine (GKE) on
Google Cloud Platform.



7.1 Ensure Stackdriver Logging is set to Enabled on Kubernetes Engine
Clusters (Scored)"
  desc  "Stackdriver Logging is part of the Stackdriver suite of products in
Google Cloud Platform. It
    includes storage for logs, a user interface called the Logs Viewer, and an
API to manage logs
    programmatically. Stackdriver Logging lets you have Kubernetes Engine
automatically
    collect, process, and store your container and system logs in a dedicated,
persistent
    datastore. Container logs are collected from your containers. System logs
are collected from
    the cluster's components, such as docker and kubelet. Events are logs about
activity in the
    cluster, such as the scheduling of Pods.
    By Enabling you will have container and system logs, Kubernetes Engine
deploys a per-
    node logging agent that reads container logs, adds helpful metadata, and
then stores them.
    The logging agent checks for container logs in the following sources:
Standard output and standard error logs from containerized processes  kubelet
and container runtime logs  Logs for system components, such as VM startup
scripts
    For events, Kubernetes Engine uses a Deployment in the kube-system
namespace which
    automatically collects events and sends them to Stackdriver Logging.
    Stackdriver Logging is compatible with JSON and glog formats. Logs are
stored for up to 30
    days.

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
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. From the list of clusters,
make sure for each cluster 'Stackdriver Logging' is set to Enabled under Cluster
section

Using Command line:
To check logging status for an existing cluster, run the following command,
gcloud container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
format json | jq '.loggingService'
The output should return logging.googleapis.com  if logging is Enabled.
"
  tag fix: "Using Console:
1. Go to Kubernetes GCP Console by visiting
https://console.cloud.google.com/kubernetes/list?
2. Select reported Kubernetes clusters for which logging is disabled
3. Click on EDIT button and Set 'Stackdriver Logging' to Enabled
Using Command Line:
To enable logging for an existing cluster, run the following command:
gcloud container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
logging-service logging.googleapis.com
"
end

