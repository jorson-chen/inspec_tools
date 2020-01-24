control "M-11.1" do
  title "11.1 Maintain Standard Security Configurations for Network Devices
Maintain standard, documented security configuration standards for all
authorized
network devices.
11.2 Document Traffic Configuration Rules
All configuration rules that allow traffic to flow through network devices
should be

documented in a configuration management system with a specific business reason
for
each rule, a specific individual’s name responsible for that business need, and
an expected
duration of the need.



4.6 Ensure VM disks for critical VMs are encrypted with Customer-
Supplied Encryption Keys (CSEK) (Scored)"
  desc  "Customer-Supplied Encryption Keys (CSEK) are a feature in Google Cloud
Storage and
    Google Compute Engine. If you supply your own encryption keys, Google uses
your key to
    protect the Google-generated keys used to encrypt and decrypt your data. By
default,
    Google Compute Engine encrypts all data at rest. Compute Engine handles and
manages
    this encryption for you without any additional actions on your part.
However, if you
    wanted to control and manage this encryption yourself, you can provide your
own
    encryption keys.
    By default, Google Compute Engine encrypts all data at rest. Compute Engine
handles and
    manages this encryption for you without any additional actions on your
part. However, if
    you wanted to control and manage this encryption yourself, you can provide
your own
    encryption keys.
    If you provide your own encryption keys, Compute Engine uses your key to
protect the
    Google-generated keys used to encrypt and decrypt your data. Only users who
can provide
    the correct key can use resources protected by a customer-supplied
encryption key.
    Google does not store your keys on its servers and cannot access your
protected data
    unless you provide the key. This also means that if you forget or lose your
key, there is no
    way for Google to recover the key or to recover any data encrypted with the
lost key.
    At least business critical VMs should have VM disks encrypted with CSEK.

  "
  impact 0.5
  tag severity: nil
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [["SC-1", 4], ["AC-6", 4]]
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
  tag check: "GCP Console
1. Go to Compute Engine
2. Go to Disks
3. For each disk
4. Ensure Encryption is set tCustomer supplied

Via CLI :
Ensure diskEncryptionKey  property in the below command's response is not null,
and
contains key sha256 with corresponding value
gcloud beta compute disks describe <diskName> --zone <zone> --
format=\"json(diskEncryptionKey,name)\"
"
  tag fix: "Currently there is no way to update the encryption of an existing
disk. Therefore create a
new disk with Encryption set toCustomer supplied
1. Go to Compute Engine
2. Go to Disks
3. For each disk
4. Set Encryption toCustomer supplied
5. Provide the Key in the box
6. Select Wrapped key
7. Click Create
Via CLI :
In the gcloud compute tool, encrypt a disk using the --csek-key-file flag
during instance
creation. If you are using an RSA-wrapped key, use the gcloud beta component:
gcloud (beta) compute instances create <instanceName> --csek-key-file
<example-file.json>
To encrypt a standalone persistent disk:
gcloud (beta) compute disks create <diskName> --csek-key-file <example-
file.json>
"
end

