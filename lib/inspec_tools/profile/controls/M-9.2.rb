control "M-9.2" do
  title "9.2 Ensure Only Approved Ports, Protocols and Services Are Running
Ensure that only network ports, protocols, and services listening on a system
with
validated business needs, are running on each system.
12.4 Deny Communication over Unauthorized Ports
Deny communication over unauthorized TCP or UDP ports or application traffic to
ensure that only authorized protocols are allowed to cross the network boundary
in or out
of the network at each of the organization's network boundaries.



3.9 Ensure VPC Flow logs is enabled for every subnet in VPC Network
(Scored)"
  desc  "Flow Logs is a feature that enables you to capture information about
the IP traffic going to
    and from network interfaces in your VPC Subnets. After you've created a
flow log, you can
    view and retrieve its data in Stackdriver Logging. It is recommended that
Flow Logs be
    enabled for every business critical VPC subnet.
    VPC networks and subnetworks provide logically isolated and secure network
partitions
    where you can launch GCP resources. When Flow Logs is enabled for a subnet,
VMs within
    subnet starts reporting on all TCP and UDP flows. Each VM samples the TCP
and UDP flows
    it sees, inbound and outbound, whether the flow is to or from another VM, a
host in your
    on-premises datacenter, a Google service, or a host on the Internet. If two
GCP VMs are
    communicating, and both are in subnets that have VPC Flow Logs enabled,
both VMs report
    the flows.
    Flow Logs supports following use cases:  Network monitoring  Understanding
network usage and optimizing network traffic expenses  Network forensics
Real-time security analysis
    Flow Logs provide visibility into network traffic for each VM inside the
subnet and can be
    used to detect anomalous traffic or insight during security workflows.

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
  tag check: "Using Console:
1. Go to VPC network GCP Console visiting
https://console.cloud.google.com/networking/networks/list
2. From the list of network subnets,
make sure for each subnet Flow Logs is set tOn
Using Command line:

gcloud compute networks subnets describe [SUBNET_NAME] --region [REGION] --
format json | jq '.enableFlowLogs'
The output of the above command returns  true, iFlow Logs is set to On.
IfFlow Logs is set to Off above command will return false or null (no-output).
"
  tag fix: "Using Console:
1. Go to VPC network GCP Console visiting
https://console.cloud.google.com/networking/networks/list
2. Click the name of a subnet, The Subnet details page is displayed
3. Click on EDIT button
4. Set Flow Logs to On
5. Click on Save
Using Command Line:
To set Private Google access for an network subnets, run the following command:
gcloud compute networks subnets update [SUBNET_NAME] --region [REGION] --
enable-flow-logs
"
end

