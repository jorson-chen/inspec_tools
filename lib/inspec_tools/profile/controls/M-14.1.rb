control "M-14.1" do
  title "14.1 Segment the Network Based on Sensitivity
Segment the network based on the label or classification level of the
information stored

on the servers, locate all sensitive information on separated Virtual Local
Area Networks
(VLANs).



7.14 Ensure PodSecurityPolicy controller is enabled on the Kubernetes
Engine Clusters (Scored)"
  desc  "A Pod Security Policy is a cluster-level resource that controls
security sensitive aspects of
    the pod specification. The PodSecurityPolicy objects define a set of
conditions that a pod
    must run with in order to be accepted into the system, as well as defaults
for the related
    fields.
    The PodSecurityPolicy defines a set of conditions that Pods must meet to be
accepted by
    the cluster; when a request to create or update a Pod does not meet the
conditions in the
    PodSecurityPolicy, that request is rejected and an error is returned. The
PodSecurityPolicy
    admission controller validates requests against available
PodSecurityPolicies.
    PodSecurityPolicies specify a list of restrictions, requirements, and
defaults for Pods
    created under the policy.

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
  tag check: "Using Command line:
To check Pod Security Policy is enabled for an existing cluster, run the
following command,
gcloud beta container clusters describe [CLUSTER_NAME] --zone [COMPUTE_ZONE]
--format json | jq '.podSecurityPolicyConfig'
Ensure the output of the above command has JSON key attribute enabled set totrue
{
\"enabled\": true
}
If Pod Security Policy is disabled above command output will return null set.
"
  tag fix: "Using Command Line:
To enable Pod Security Policy for an existing cluster, run the following
command:

gcloud beta container clusters update [CLUSTER_NAME] --zone [COMPUTE_ZONE] --
enable-pod-security-policy
"
end

