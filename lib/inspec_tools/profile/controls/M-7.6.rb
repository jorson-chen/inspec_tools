control "M-7.6" do
  title "7.6 Ensure Kubernetes web UI / Dashboard is disabled (Scored)"
  desc  "Dashboard is a web-based Kubernetes user interface. You can use
Dashboard to deploy
    containerized applications to a Kubernetes cluster, troubleshoot your
containerized
    application, and manage the cluster itself along with its attendant
resources. You can use
    Dashboard to get an overview of applications running on your cluster, as
well as for
    creating or modifying individual Kubernetes resources (such as Deployments,
Jobs,
    DaemonSets, etc). For example, you can scale a Deployment, initiate a
rolling update,
    restart a pod or deploy new applications using a deploy wizard.
    You should disable the Kubernetes Web UI (Dashboard) when running on
Kubernetes
    Engine. The Kubernetes Web UI (Dashboard) is backed by a highly privileged
Kubernetes
    Service Account.

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
  tag check: "From Console
1. Go to Kubernetes Engine  .
2. Go to Kubernetes clusters  .
3. For every Kubernetes cluster  .
4. Click on Add-ons .
5. Ensure Kubernetes dashboard  isDisabled
Using Command line:
gcloud container clusters describe [CLUSTER_NAME] --zone [ZONE] --format json
| jq '.addonsConfig.kubernetesDashboard'
Ensure the output of the above command has JSON key attribute  disabled set
totrue
{
\"disabled\": true
}
"
  tag fix: "From Console

1. Go to Kubernetes Engine  .
2. Go to Kubernetes clusters  .
3. For every Kubernetes cluster  click on edit.
4. Click on Add-ons .
5. Select Disabled from dropdown of  Kubernetes dashboard   .
Using Command line:
To disable the Kubernetes Web UI:
gcloud container clusters update [CLUSTER_NAME]      --update-
addons=KubernetesDashboard=DISABLED --zone [ZONE]
"
end

