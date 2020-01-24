control "M-1799987798.1507876265" do
  title "1799987798.1507876265
CIS Controls:
Version 7

9.2 Ensure Only Approved Ports, Protocols and Services Are Running
Ensure that only network ports, protocols, and services listening on a system
with
validated business needs, are running on each system.



4.5 Ensure that IP forwarding is not enabled on Instances (Not Scored)"
  desc  "Compute Engine instance cannot forward a packet unless the source IP
address of the
    packet matches the IP address of the instance. Similarly, GCP won't deliver
a packet whose
    destination IP address is different than the IP address of the instance
receiving the packet.
    However, both capabilities are required if you want to use instances to
help route packets.
    Forwarding of data packets should be disabled to prevent data loss or
information
    disclosure.
    Compute Engine instance cannot forward a packet unless the source IP
address of the
    packet matches the IP address of the instance. Similarly, GCP won't deliver
a packet whose
    destination IP address is different than the IP address of the instance
receiving the packet.
    However, both capabilities are required if you want to use instances to
help route packets.
    To enable this source and destination IP check, disable tcanIpForward
field, which
    allows an instance to send and receive packets with non-matching
destination or source
    IPs.

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
  tag check: "1. Go to Compute Engine
2. Go to the VM Instances
3. For every VM Instance
4. Ensure IP forwarding  is set tOff under Network interfaces  section.
Via CLI gcloud :
gcloud compute instances list --format='table(name,canIpForward)'
Ensure that CAN_IP_FORWARD column in the output of above command does not
contain
True against any VM Instance.
"
  tag fix: "1. Go to the Compute Engine
2. Go to VM Instances

3. Select the VM Instance .
4. Click Delete button.
Via CLI gcloud :
gcloud compute instances delete <VM_Name>
As you can only set the canIpForward  field at instance creation time. After an
instance is
created, the field becomes read-only. Therefore delete the VM instance where
canIpForward  is set ttrue .
And create a new VM Instance with  IP forwarding  is set tOff
1. Go to Compute Engine
2. Click theCreate instance  button.
3. Click Management, disk, networking, SSH keys.
4. Click Networking .
5. Click on the specificNetwork interfaces
6. Ensure IP forwarding  is set toff .
7. Specify any other instance parameters you desire.
8. Click Create.
"
end

