control "M-4.7" do
  title "4.7 Limit Access to Script Tools
Limit access to scripting tools (such as Microsoft PowerShell and Python) to
only
administrative or development users with the need to access those capabilities.
16 Account Monitoring and Control
Account Monitoring and Control



4.2 Ensure \"Block Project-wide SSH keys\" enabled for VM instances
(Scored)"
  desc  "It is recommended to user Instance specific SSH key(s) instead of
using common/shared
    project-wide SSH key(s) to access Instances.
    Project-wide SSH keys are stored in Compute/Project-meta-data. Project wide
SSH keys
    can be used to login into all the instances within project. Using
project-wide SSH keys eases
    the SSH key management but if compromised, poses the security risk which
can impact all
    the instances within project. It is recommended to use Instance specific
SSH keys which can
    limit the attack surface if the SSH keys are compromised.

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
1. Go to the VM instances page using
https://console.cloud.google.com/compute/instances?    . It will list all the
instances from project.
2. Click on the name of the instance
3. Under SSH Keys, Ensure  Block project-wide SSH keys   is selected.
4. Check for every Instance.
via CLI gcloud:
1. List all Instances from a project:
gcloud compute instances list
2. Get instance metadata
gcloud compute instacnces describe [Instance_Name]
3. for every instance Ensure key: block-project-ssh-keys  set tovalue: 'true'

"
  tag fix: "Using Console:
1. Go to the VM instances page using
https://console.cloud.google.com/compute/instances?    . It will list all the
instances from project
2. Click on the name of the Impacted instance
3. Click Edit in the toolbar
4. Under SSH Keys, go to the Block project-wide SSH keys   checkbox
5. To block users with project-wide SSH keys from connecting to this instance,
select
Block project-wide SSH keys
6. click Save at the bottom of the page
7. Repeat steps for every impacted Instance
via CLI gcloud:
Block project-wide public SSH keys, set the metadata value toTRUE :
gcloud compute instances add-metadata [INSTANCE_NAME] --metadata block-
project-ssh-keys=TRUE
where [INSTANCE_NAME] is the name of the instance that you want to block
project-wide
public SSH keys.
"
end

