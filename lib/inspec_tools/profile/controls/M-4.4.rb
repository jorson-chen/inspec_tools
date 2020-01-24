control "M-4.4" do
  title "4.4 Ensure 'Enable connecting to serial ports' is not enabled for VM
Instance (Scored)"
  desc  "Interacting with a serial port is often referred to as the serial
console, which is similar to
    using a terminal window, in that input and output is entirely in text mode
and there is no
    graphical interface or mouse support.
    If you enable the interactive serial console on an instance, clients can
attempt to connect to
    that instance from any IP address. Therefore interactive serial console
support should be
    disabled.
    A virtual machine instance has four virtual serial ports. Interacting with
a serial port is
    similar to using a terminal window, in that input and output is entirely in
text mode and
    there is no graphical interface or mouse support. The instance's operating
system, BIOS,
    and other system-level entities often write output to the serial ports, and
can accept input
    such as commands or answers to prompts. Typically, these system-level
entities use the
    first serial port (port 1) and serial port 1 is often referred to as the
serial console.
    The interactive serial console does not support IP-based access
restrictions such as IP
    whitelists. If you enable the interactive serial console on an instance,
clients can attempt to
    connect to that instance from any IP address. This allows anybody to
connect to that
    instance if they know the correct SSH key, username, project ID, zone, and
instance name.
    Therefore interactive serial console support should be disabled.

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
  tag check: "1. Login to Google Cloud console
2. Go to Computer Engine
3. Go to VM instances
4. Click on the Specific VM
5. Ensure Enable connecting to serial ports   below Remote access  block is
unselected.

Via CLI gcloud :
Ensure the below command's output shows null
gcloud compute instances describe <vmName> --zone=<region> --
format=\"json(metadata.items[].key,metadata.items[].value)
or
`key` and `value` properties from below command's json response are equal to
`serial-port-  enable` and `0` or `false` respectively.
i,e
{
\"metadata\": {
\"items\": [
{
\"key\": \"serial-port-enable\",
\"value\": \"0\"
}
]
}
}
"
  tag fix: "1. Login to Google Cloud console
2. Go to Computer Engine
3. Go to VM instances
4. Click on the Specific VM
5. Click EDIT
6. Unselect Enable connecting to serial ports  below Remote access block.
7. Click Save
Via CLI gcloud :
Use the below command to disable
gcloud compute instances add-metadata <vmName> --zone=<region> --
metadata=serial-port-enable=false
or
gcloud compute instances add-metadata <vmName> --zone=<region> --
metadata=serial-port-enable=0
"
end

