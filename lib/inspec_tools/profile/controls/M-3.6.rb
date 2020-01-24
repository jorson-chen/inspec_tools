control "M-3.6" do
  title "3.6 Ensure that SSH access is restricted from the internet (Scored)"
  desc  "GCP Firewall Rules  are specific to VPC Network . Each rule
eitheallows or denies
    traffic when its conditions are met. Its conditions allow you to specify
the type of traffic,
    such as ports and protocols, and the source or destination of the traffic,
including IP
    addresses, subnets, and instances. Firewall rules are defined at the VPC
network level, and
    are specific to the network in which they are defined. The rules themselves
cannot be
    shared among networks. Firewall rules only support IPv4 traffic. When
specifying a source
    for an ingress rule or a destination for an egress rule by address, you can
only usIPv4
    address or IPv4 block in CIDR  notation. Generic(0.0.0.0/0) incoming
traffic from
    internet to VPC or VM instance usingSSH on Port 22 can be avoided.
    GCP Firewall Rules  within a VPC Network . These rules apply to outgoing
(egress) traffic
    from instances and incoming (ingress) traffic to instances in the network.
Egress and
    ingress traffic are controlled even if the traffic stays within the network
(for example,
    instance-to-instance communication). For an instance to have outgoing
Internet access, the
    network must have a valid Internet gateway route or custom route whose
destination IP is
    specified. This route simply defines the path to the Internet, to avoid the
most general
    (0.0.0.0/0) destination IP Range specified from Internet through SSH with
defaultPort
    22. We need to restrict generic access from Internet to specific IP Range.

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
  tag check: "From Console
1. Go to VPC network .
2. Go to the Firewall Rules .
3. Ensure Port is not equal to22 and Action is notAllow .
4. Ensure IP Ranges is not equal t"
  tag fix: nil
end

