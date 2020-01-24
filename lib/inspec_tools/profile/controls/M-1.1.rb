control "M-1.1" do
  title "1.1 Ensure that corporate login credentials are used instead of Gmail
accounts (Scored)"
  desc  "Use corporate login credentials instead of Gmail accounts.
    Gmail accounts are personally created and controllable accounts.
Organizations seldom
    have any control over them. Thus, it is recommended that you use fully
managed corporate
    Google accounts for increased visibility, auditing, and control over access
to Cloud Platform
    resources.

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
  tag check: "For each Google Cloud Platform project, list the accounts
configured in that project:
gcloud projects get-iam-policy <Project-ID> | grep gmail.com
No Gmail accounts should be listed.
"
  tag fix: "Follow the documentation and setup corporate login accounts.
"
end

