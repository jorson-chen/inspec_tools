control "M-0.001" do
  title "0.001  AND conditions.conditionThreshold.aggregations.alignmentPeriod
  set to60s  AND conditions.conditionThreshold.aggregations.crossSeriesReducer
  set to
REDUCE_COUNT  AND conditions.conditionThreshold.aggregations.perSeriesAligner
 set to
ALIGN_RATE ,  AND enabled is set true
Remediation:
From GCP Console, Create prescribed Log Metric:
1. Go to Logging/Logs by visitinhttps://console.cloud.google.com/logs/viewer?
2. Click down arrow symbol on Filter Bar at rightmost corner and selecConvert to
Advanced Filter
3. This will convertFilter Bar toAdvanced Filter Bar
4. Clear any text fromAdvanced Filter and add text
protoPayload.methodName=\"cloudsql.instances.update\"

5. Click on Submit Filter and should display logs based on filter text set in
step above
6. Click Create Metric it will openMetric Export Menu on right
7. Configure Name,Description to desired values
8. Set Units to1 (default) andType toCounter
9. Click Create Metric . This will take Logging/Logs at
https://console.cloud.google.com/logs/metrics?
From Stackdriver Console, Create prescribed Alert Policy:
1. Go to Logging/Metrics  by visiting
https://console.cloud.google.com/logs/metrics?
2. In section User-defined Metrics  for target metric, click 3 dot icon in
rightmost
column to open menu options
3. Select Create alert from Metric  .
4. It will take tStackdriver Console\\Alerting\\Create   and directly open Add
Metric Threshold Condition  window
Set `Target`: `Resource Type` to `Log Metric`
Set `Configuration`:
- IF METRIC : user/<Log Metric Name>
- Condition : above
- Threshold: .001
- For: 1 minute
Set `Resource` to `ANY`
ClickSave Condition
5. It will take back tStackdriver Console\\Alerting\\Create
6. In Section 2 Notifications  clic+ Add Notification  . Add desired channel(s)
as
required.
7. In section 3 Documentation optionally + Add Documentation
8. In Section 4 Name this policy  leave system provided policy name (Threshold -
user/) or configure custom name
9. Click Save Policy . It will opAlerting/Policies Overview  page which lists
all
the alert policies including this one.
For alert policy Observe Condition which is currently set to
Any logging.googleapis.com/user/<Log_Metric_Name> is above a threshold of
0.001 for greater than 1 minute

It is been observed that without following next step, Alert policy will not
generate any
alerts or open any incidents.
10.For newly created policy, clickEDIT to Open Edit alerting Policy  pane
11.At section 1 Conditions\\Basic Conditions\\suggested condition click Edit
12.In Target Section, foAggregation drop down select count
13.Click save condition  and then clickSave Policy . It will
opeAlerting/Policies
Overview
Condition for same alert policy will be updated to:
Violates when: Any logging.googleapis.com/user/<Log_Metric_Name> stream is
above a threshold of 0.001 for greater than 1 minute
Now, newly created Alert policy will be able to generate alerts or open
incidents.
Using CLI
Create prescribed Log Metric  Use command: gcloud beta logging metrics create
Reference for Command Usage:
https://cloud.google.com/sdk/gcloud/reference/beta/logging/metrics/create
Create prescribed Alert Policy  Use command: gcloud alpha monitoring policies
create  Reference for command Usage:
https://cloud.google.com/sdk/gcloud/reference/alpha/monitoring/policies/create
Impact:
Based on Service Tiers, Stackdriver account may be charged.
References:
1. https://cloud.google.com/logging/docs/logs-based-metrics/
2. https://cloud.google.com/monitoring/custom-metrics/
3. https://cloud.google.com/monitoring/alerts/
4. https://cloud.google.com/logging/docs/reference/tools/gcloud-logging
5. https://cloud.google.com/storage/docs/overview
6. https://cloud.google.com/sql/docs/
7. https://cloud.google.com/sql/docs/mysql/
8. https://cloud.google.com/sql/docs/postgres/

Notes:
Before considering this recommendation Ensure target GCP project is configured
with
stackdriver account.
CIS Controls:
Version 7
6.2 Activate audit logging
Ensure that local logging has been enabled on all systems and networking
devices.
6.3 Enable Detailed Logging
Enable system logging to include detailed information such as a event source,
date, user,
timestamp, source addresses, destination addresses, and other useful elements.

3 Networking
This section covers recommendations addressing networking on Google Cloud
Platform.



3.1 Ensure the default network does not exist in a project (Scored)"
  desc  "To prevent use ofdefault network, a project should not have default
network.
    The default network has automatically created firewall rules and has
pre-fabricated
    network configuration. Based on your security and networking requirements,
you should
    create your network and delete thedefault network.

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
1. Set the project name in the Google Cloud Shell:
gcloud config set project <Project-ID>
2. List the networks configured in that project:
gcloud compute networks list
It should not lidefault as one of the available networks in that project.
"
  tag fix: "For each Google Cloud Platform project,
1. Follow the documentation and create a new network suitable for your
requirements.
2. Follow the documentation and delete the default network.
"
end

