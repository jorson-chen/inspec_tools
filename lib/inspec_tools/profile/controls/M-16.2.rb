control "M-16.2" do
  title "16.2 Configure Centralized Point of Authentication
Configure access for all accounts through as few centralized points of
authentication as
possible, including network, security, and cloud systems.



1.2 Ensure that multi-factor authentication is enabled for all non-service
accounts (Not Scored)"
  desc  "Setup multi-factor authentication for Google Cloud Platform accounts.
    Multi-factor authentication requires more than one mechanism to
authenticate a user. This
    secures your logins from attackers exploiting stolen or weak credentials.

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
  tag check: "For each Google Cloud Platform project,
Step 1: Identify the non-service accounts.
Step 2: Manually verify that multi-factor authentication for each account is
set.
"
  tag fix: "For each Google Cloud Platform project,
Step 1: Identify the non-service accounts.
Step 2: Setup multi-factor authentication for each account.
"
end

