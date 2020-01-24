control "M-2.4" do
  title "2.4 Ensure log metric filter and alerts exists for Project Ownership
assignments/changes (Scored)"
  desc  "In order to prevent unnecessarily project ownership assignments to
users/service-
    accounts and further misuses of project and resources, roles/Owner
assignments should
    be monitored.
    Members (users/Service-Accounts) with role assignment to primitive
roleroles/owner are
    Project Owners.
    Project Owner has all the privileges on a project it belongs to. These can
be summarized as
    below:
    - All viewer permissions on All GCP Services part within the project
    - Permissions for actions that modify state of All GCP Services within the
    project
    - Manage roles and permissions for a project and all resources within the
    project
    - Set up billing for a project
    Granting owner role to a member (user/Service-Account) will allow members
to modify
    the IAM policy. Therefore grant the owner role only if the member has a
legitimate purpose
    to manage the IAM policy. This is because as project IAM policy contains
sensitive access
    control data and having a minimal set of users manage it will simplify any
auditing that you
    may have to do.
    Project Ownership Having highest level of privileges on a project, to avoid
misuse of project
    resources project ownership assignment/change actions mentioned should be
monitored
    and alerted to concerned recipients.
    - Sending project ownership Invites
    - Acceptance/Rejection of project ownership invite by user
    - Adding `role\\owner` to a user/service-account
    - Removing a user/Service account from `role\\owner`


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
  tag check: "From GCP Console, Ensure prescribed Log metric present:
1. Go to Logging/Metrics by visiting
https://console.cloud.google.com/logs/metrics?   https://console.cloud.google.c
om/logs/metrics?
2. In User-defined Metrics  ensure at least one metri<Log_Metric_Name>  present
with filter text:
(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\") AND
(ProjectOwnership OR projectOwnerInvitee) OR
(protoPayload.serviceData.policyDelta.bindingDeltas.action=\"REMOVE\" AND
protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\") OR
(protoPayload.serviceData.policyDelta.bindingDeltas.action=\"ADD\" AND
protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\")
From Stackdriver Console, Ensure prescribed Alerting Policy present:
1. Go to stackdriver account athttps://app.google.stackdriver.com/   and select
target GCP project on top bar by clicking drop-down arrow symbol.
2. Go to in Left column clicAlerting selectPolicies Overview
3. on POLICIES WITH BASIC CONDITIONS  page ensure at least one of the Policies
with
conditionViolates when: Any logging.googleapis.com/user/<Log Metric
Name> stream is above a threshold of .001 for greater than 1 minute
present and state iON
Ensure Alerting Policy Notifications are configured to appropriate
subscribers/recipients:
on POLICIES WITH BASIC CONDITIONS  page click targePolicy Name to open policy
configuration. Check Notifications section for appropriate
subscribers/Recipients.
Using CLI, Ensure prescribed Log metric present:
gcloud beta logging metrics list --format json
Output should contain a metric with filter set to
(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\") AND
(ProjectOwnership OR projectOwnerInvitee) OR
(protoPayload.serviceData.policyDelta.bindingDeltas.action=\"REMOVE\" AND
protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\") OR
(protoPayload.serviceData.policyDelta.bindingDeltas.action=\"ADD\" AND
protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\")
property metricDescriptor.name  for the identified metric that will be used in
next step.
Using CLI, Ensure prescribed Alerting Policy present:

gcloud alpha monitoring policies list --format json
Output should contain an alert policy where:  conditions.filter is set
t\"project= \"<ProjectID>\" AND
metric.type=\"<metricDescriptor.type from previous command output>\"\"  AND
conditions.filter does not contain any other parameter thanmetric.type
and project which will restrict alerting to a particular resource/type e.g..
resource.type  AND conditions.thresholdValue  set to"
  tag fix: nil
end

