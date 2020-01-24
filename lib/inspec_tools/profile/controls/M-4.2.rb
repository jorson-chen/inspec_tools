control "M-4.2" do
  title "4.2 Change Default Passwords
Before deploying any new asset, change all default passwords to have values
consistent
with administrative level accounts.



6.4 Ensure that MySQL Database Instance does not allows root login
from any Host (Scored)"
  desc  "It is recommended that root access to a MySql Database Instance should
be allowed only
    through specific white-listed trusted IPs.
    When root access is allowed for any host, any host from authorized networks
can attempt
    to authenticate to a MySql Database Instance using administrative
privileges. To minimize
    attack surface root access can explicitly allowed from only trusted IPs
(Hosts) to support
    database related administrative tasks.

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
  tag check: "Using Google Cloud Console:
1. Go to the MySql Instances page in the Google Cloud Platform Console using
https://console.cloud.google.com/MySql/
2. Select the instance to open its Overview page.
3. Select Access Control > Users  .
4. User Name root should not be associated with Host Name containing %(any
host) or"
  tag fix: nil
end

