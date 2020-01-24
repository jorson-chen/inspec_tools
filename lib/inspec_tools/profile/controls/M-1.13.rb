control "M-1.13" do
  title "1.13 Ensure API keys are rotated every 90 days (Scored)"
  desc  "It is recommended to rotate API keys every 90 days.
    Security risks involved in using API-Keys are below:  API keys are a simple
encrypted strings  API keys do not identify the user or the application making
the API request  API keys are typically accessible to clients, making it easy
to discover and steal an
    API key
    Because of this Google recommend using the standard authentication flow
instead.
    However, there are limited cases where API keys are more appropriate. For
example, if
    there is a mobile application that needs to use the Google Cloud
Translation API, but
    doesn't otherwise need a backend server, API keys are the simplest way to
authenticate to
    that API.
    Once the key is stolen, it has no expiration, so it may be used
indefinitely, unless the project
    owner revokes or regenerates the key. Rotating API keys will reduce the
window of
    opportunity for an access key that is associated with a compromised or
terminated account
    to be used. API keys should be rotated to ensure that data cannot be
accessed with an old
    key which might have been lost, cracked, or stolen.

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
  tag check: "From Console:
1. Go to APIs & Services\\Credentials   using
https://console.cloud.google.com/apis/credentials
2. In Section API Keys , for every key ensurecreation date is less than 90 days.
"
  tag fix: "From Console:
1. Go to APIs & Services\\Credentials   using
https://console.cloud.google.com/apis/credentials

2. In Section API Keys , Click on thAPI Key Name . It will display API Key
properties on
new page
3. Click REGENERATE KEY  to rotate API key
4. Click Save
5. Repeat steps 2,3,4 for every API key that is has not been rotated in last 90
days
Note: Do not setHTTP referrers  to wild-cards (* or *.[TLD] or .[TLD]/)
allowing access to
any/wide HTTP referrer(s)
Do not setIP addresses  and referrer toany host ("
end

