control "M-4.3" do
  title "4.3 Ensure oslogin is enabled for a Project (Scored)"
  desc  "Enabling OS login binds SSH certificates to IAM users and facilitates
effective SSH certificate
    management.
    Enabling osLogin ensures that SSH keys used to connect to instances are
mapped with IAM
    users. Revoking access to IAM user will revoke all the SSH keys associated
with that
    particular user. It facilitates centralized and automated SSH key pair
management which is
    useful in handling cases like response to compromised SSH key pairs and/or
revocation of
    external/third-party/Vendor users.

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
1. Go to the VM compute metadata page using
https://console.cloud.google.com/compute/metadata?     .
2. Ensure key enable-oslogin  present with value set toTRUE
Via CLI gcloud:
gcloud compute project-info describe
Ensure section commonInstanceMetadata   has key enable-oslogin  set to valueTRUE
"
  tag fix: "Set enable-oslogin  in project-wide metadata so that it applies to
all of the instances in
your project:
Using Console:
1. Go to the VM compute metadata page using
https://console.cloud.google.com/compute/metadata?     .
2. ClickEdit .
3. Add a metadata entry where the key is enable-oslogin  and the value isTRUE .
4. ClickSave to apply the changes.

Via CLI gcloud:
gcloud compute project-info add-metadata --metadata enable-oslogin=TRUE
"
end

