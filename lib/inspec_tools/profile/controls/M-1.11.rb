control "M-1.11" do
  title "1.11 Ensure API keys are restricted to use by only specified Hosts and
Apps (Not Scored)"
  desc  "Unrestricted keys are insecure because they can be viewed publicly,
such as from within a
    browser, or they can be accessed on a device where the key resides. It is
recommended to
    restrict API key usage only from trusted hosts, HTTP referrers and apps.
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
    doesn't otherwise need a back-end server, API keys are the simplest way to
authenticate to
    that API.
    In order to reduce attack vector, API-Keys can be restricted only to the
trusted hosts, HTTP
    referrers and applications.

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
1. Go to APIs & Services\\Credentials  using
https://console.cloud.google.com/apis/credentials
2. In Section API Keys , Click on thAPI Key Name . it will display API Key
properties on
new page.
3. For every API Key, ensure section Key restrictions  parameter Application
restrictions is not set tNone
Or
ensure Application restrictions   is set tHTTP referrers and referrer is not
set to wild-

cards (* or *.[TLD] or *.[TLD]/*) allowing access to any/wide HTTP referrer(s)
Or
ensure Application restrictions  is set tIP addresses  and referrer is not set
any
host ("
  tag fix: nil
end

