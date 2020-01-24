control "M-1.9" do
  title "1.9 Ensure that Separation of duties is enforced while assigning KMS
related roles to users (Scored)"
  desc  "It is recommended that the principle of 'Separation of Duties' is
enforced while assigning
    KMS related roles to users.
    Built-in/Predefined IAM role Cloud KMS Admin  allows user/identity to
create, delete, and
    manage service account(s). Built-in/Predefined IAM role Cloud KMS CryptoKey
    Encrypter/Decrypter  allows user/identity (with adequate privileges on
concerned
    resources) to encrypt and decrypt data at rest using encryption key(s).
Built-in/Predefined
    IAM role Cloud KMS CryptoKey Encrypter   allows user/identity (with
adequate privileges
    on concerned resources) to encrypt data at rest using encryption key(s).
Built-
    in/Predefined IAM role Cloud KMS CryptoKey Decrypter   allows user/identity
(with
    adequate privileges on concerned resources) to decrypt data at rest using
encryption
    key(s).
    Separation of duties is the concept of ensuring that one individual does
not have all
    necessary permissions to be able to complete a malicious action. In Cloud
KMS, this could
    be an action such as using a key to access and decrypt data that that user
should not
    normally have access to. Separation of duties is a business control
typically used in larger
    organizations, meant to help avoid security or privacy incidents and
errors. It is considered
    best practice.
    Any user(s) should not have Cloud KMS Admin  and any of theCloud KMS
CryptoKey
    Encrypter/Decrypter  ,Cloud KMS CryptoKey Encrypter   ,Cloud KMS CryptoKey
    Decrypter roles assigned at a time.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["RA-5", 4]]
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
  tag check: "From Console:
1. Go to IAM & Admin/IAM  using https://console.cloud.google.com/iam-admin/iam

2. Ensure no member has roles  Cloud KMS Admin  and any of the Cloud KMS
CryptoKey
Encrypter/Decrypter  ,Cloud KMS CryptoKey Encrypter   ,Cloud KMS CryptoKey
Decrypter assigned.
Via CLI gcloud:
1. List all users and role assignments:
gcloud projects get-iam-policy [Project_ID]
2. Ensure that there are no common users found in member section for roles
cloudkms.admin  and any one of Cloud KMS CryptoKey Encrypter/Decrypter   ,
Cloud KMS CryptoKey Encrypter   ,Cloud KMS CryptoKey Decrypter
"
  tag fix: "From Console:
1. Go to IAM & Admin/IAM  using https://console.cloud.google.com/iam-admin/iam
2. For member having  Cloud KMS Admin  and any of the Cloud KMS CryptoKey
Encrypter/Decrypter  ,Cloud KMS CryptoKey Encrypter   ,Cloud KMS CryptoKey
Decrypter roles granted/assigned, click on theDelete Bin icon to remove role
from
member.
Note: Removal of a roles should be done as per the business requirement.
"
end

