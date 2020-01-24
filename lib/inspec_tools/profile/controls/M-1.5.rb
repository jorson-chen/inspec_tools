control "M-1.5" do
  title "1.5 Ensure that IAM users are not assigned Service Account User role at
project level (Scored)"
  desc  "It is recommended to assign Service Account User
(iam.serviceAccountUser)     role to a
    user for a specific service account rather than assigning the role to a
user at project level.
    A service account is a special Google account that belongs to application
or a virtual
    machine (VM), instead of to an individual end user. Application/VM-Instance
uses the
    service account to call the Google API of a service, so that the users
aren't directly involved.
    In addition to being an identity, a service account is a resource which has
IAM policies
    attached to it. These policies determine who can use the service account.
    Users with IAM roles to update the App Engine and Compute Engine instances
(such as App
    Engine Deployer or Compute Instance Admin) can effectively run code as the
service
    accounts used to run these instances, and indirectly gain access to all the
resources for
    which the service accounts has access. Similarly, SSH access to a Compute
Engine instance
    may also provide the ability to execute code as that instance/Service
account.
    As per business needs, there could be multiple user-managed service
accounts configured
    for a project. Granting theiam.serviceAccountUser  role to a user for a
project gives the
    user access to all service accounts in the project, including service
accounts that may be
    created in the future. This can result into elevation of privileges by
using service accounts
    and corresponding  Compute Engine instances  .
    In order to implement least privileges  best practices, IAM users should
not be assigned
    Service Account User  role at project level. Insteaiam.serviceAccountUser
role should
    be assigned to a user for a specific service account giving a user access
to the service
    account.

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
  tag check: "From Console:
1. Go to the IAM page in the GCP Console using
https://console.cloud.google.com/iam-admin/iam

2. Click on filter table text bar, TRole: Service Account User
3. Ensure no user is listed as a result of filter.
Via CLI gcloud:
To ensure IAM users are not assigned Service Account User role at project level
gcloud projects get-iam-policy zeta-environs-192610 --format json | jq
'.bindings[].role' | grep \"roles/iam.serviceAccountUser\"
Command should not return any output.
"
  tag fix: "From Console:
1. Go to the IAM page in the GCP Console using
https://console.cloud.google.com/iam-admin/iam
2. Click on filter table text bar, TRole: Service Account User
3. Click Delete Bin icon in front of roService Account User  for every user
listed as
a result of a filter.
Via CLI gcloud :
1. Using a text editor, Remove Role which contains
roles/iam.serviceAccountUser. Add
a role to the bindings array that defines the group members and the role for
those
members.
For example, you can use the iam.json file shown below as follows:
{
\"bindings\": [
{
\"members\": [
\"serviceAccount:our-project-123@appspot.gserviceaccount.com\",
],
\"role\": \"roles/appengine.appViewer\"
},
{
\"members\": [
\"user:email1@gmail.com\"
],
\"role\": \"roles/owner\"
},
{
\"members\": [
\"serviceAccount:our-project-123@appspot.gserviceaccount.com\",
\"serviceAccount:123456789012-compute@developer.gserviceaccount.com\"
],
\"role\": \"roles/editor\"
}
],

\"etag\": \"BwUjMhCsNvY=\"
}
2. Update the project's IAM policy:
gcloud projects set-iam-policy PROJECT_ID iam.json
"
end

