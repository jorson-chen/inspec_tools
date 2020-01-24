control "M-16.3" do
  title "16.3 Require Multi-factor Authentication
Require multi-factor authentication for all user accounts, on all systems,
whether
managed onsite or by a third-party provider.



1.3 Ensure that there are only GCP-managed service account keys for
each service account (Scored)"
  desc  "User managed service account should not have user managed keys.
    Anyone who has access to the keys will be able to access resources through
the service
    account. GCP-managed keys are used by Cloud Platform services such as App
Engine and
    Compute Engine. These keys cannot be downloaded. Google will keep the keys
and
    automatically rotate them on an approximately weekly basis. User-managed
keys are
    created, downloadable, and managed by users. They expire 10 years from
creation.
    For user-managed keys, user have to take ownership of key management
activities which
    includes:  Key storage  Key distribution  Key revocation  Key rotation
Protecting the keys from unauthorized users  Key recovery
    Even after owner's precaution, keys can be easily leaked by common
development
    malpractices like checking keys into the source code or leaving them in
Downloads
    directory, or accidentally leaving them on support blogs/channels.
    It is recommended to prevent use of User-managed service account keys.

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
  tag check: "From CLI:
List All the service accounts:
gcloud iam service-accounts list
Identify user managed service accounts as such account EMAIL ends with

iam.gserviceaccount.com
For each user managed Service Account, list the keys managed by the user:
gcloud iam service-accounts keys list --iam-account=<Service Account> --
managed-by=user
No keys should be listed.
"
  tag fix: "From CLI:
To delete User manages Service Account Key,
gcloud iam service-accounts keys delete --iam-account=<user-managed-service-
account-EMAIL> <KEY-ID>
"
end

