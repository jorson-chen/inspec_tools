control "M-3.5" do
  title "3.5 Ensure that RSASHA1 is not used for zone-signing key in Cloud DNS
DNSSEC (Not Scored)"
  desc  "DNSSEC algorithm numbers in this registry may be used in CERT RRs.
Zone signing
    (DNSSEC) and transaction security mechanisms (SIG(0) and TSIG) make use of
particular
    subsets of these algorithms. The algorithm used for key signing should be
recommended
    one and it should not be weak.
    DNSSEC algorithm numbers in this registry may be used in CERT RRs.
Zonesigning
    (DNSSEC) and transaction security mechanisms (SIG(0) and TSIG) make use of
particular
    subsets of these algorithms.
    The algorithm used for key signing should be recommended one and it should
not be weak.
    When enabling DNSSEC for a managed zone, or creating a managed zone with
DNSSEC, you
    can select the DNSSEC signing algorithms and the denial-of-existence type.
Changing the
    DNSSEC settings is only effective for a managed zone if DNSSEC is not
already enabled. If
    you need to change the settings for a managed zone where it has been
enabled, you can
    turn DNSSEC off and then re-enable it with different settings.

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
  tag check: "Currently there is no support to audit this setting through
console.
Via CLI :
Ensure the property algorithm for keyType zoneSigning is not using RSASHA1.
gcloud beta dns managed-zones describe <zoneName> —
format=\"json(dnsName,dnssecConfig.state,dnssecConfig.defaultKeySpecs)\"
"
  tag fix: "Use the below command update Cloud DNS managed zone signing key
algorithm to
recommended algorithm.
Via CLI :
gcloud beta dns managed-zones update EXAMPLE_ZONE --dnssec-state on --
zsk-algorithm <algorithmName> —zsk-key-length <keyLength>

Supported algorithm options and key lengths are as follows.
Algorithm          KSK Length       ZSK Length
---------          ----------       ----------
RSASHA1           1024,2048       1024,2048
RSASHA256          1024,2048       1024,2048
RSASHA512          1024,2048       1024,2048
ECDSAP256SHA256       256          384
ECDSAP384SHA384       384          384
"
end

