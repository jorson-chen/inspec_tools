control "M-1.4" do
  title "1.4 Ensure that ServiceAccount has no Admin privileges. (Scored)"
  desc  "A service account is a special Google account that belongs to your
application or a VM,
    instead of to an individual end user. Your application uses the service
account to call the
    Google API of a service, so that the users aren't directly involved. It's
recommended not to
    use admin access for ServiceAccount.
    Service accounts represent service-level security of the Resources
(application or a VM)
    which can be determined by the roles assigned to it. Enrolling
ServiceAccount with Admin
    rights gives full access to assigned application or a VM, ServiceAccount
Access holder can
    perform critical actions like delete, update change settings etc. without
the intervention of
    user, so It's recommended not to have Admin rights.
    This recommendation is applicable only for User-Managed user created
service account
    (Service account with nomenclature:
    SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com    ).

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
  tag check: "From Console
1. Go to IAM & admin/IAM using https://console.cloud.google.com/iam-admin/iam
2. Go to the Members
3. Ensure that there are no User-Managed user created service account(s)    with
roles containing*Admin or role matchingEditor or role matchingOwner
Via CLI gcloud :
1. Get the policy that you want to modify, and write it to a JSON file:
gcloud projects get-iam-policy PROJECT_ID --format json > iam.json
2. The contents of the JSON file will look similar to the following. Note role
of
members group associated with each  serviceaccount does not contains *Admin or
does not matches roles/editor  or does not matches roles/owner
Sample Json output:

{
\"bindings\": [
{
\"members\": [
\"serviceAccount:our-project-123@appspot.gserviceaccount.com\",
],
\"role\": \"roles/appengine.appAdmin\"
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
\"etag\": \"BwUjMhCsNvY=\",
\"version\": 1
}
"
  tag fix: "From Console
1. Go to IAM & admin/IAM using https://console.cloud.google.com/iam-admin/iam
2. Go to theMembers
3. IdentifyUser-Managed user created  service account with roles contain*Admin
or role matchingEditor or role matchingOwner
4. ClickDelete bin icon to remove role from member (service account in this
case)
Via CLI gcloud :
1. Using a text editor, RemovRole which containsroles/*Admin or matched
roles/editor or matches 'roles/owner`. Add a role to the bindings array that
defines the group members and the role for those members.
For example, to grant the role roles/appengine.appViewer to ServiceAccount
which is
roles/editor, you would change the example shown below as follows:
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

