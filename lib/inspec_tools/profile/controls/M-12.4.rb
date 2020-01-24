control "M-12.4" do
  title "12.4 Deny Communication over Unauthorized Ports
Deny communication over unauthorized TCP or UDP ports or application traffic to
ensure that only authorized protocols are allowed to cross the network boundary
in or out
of the network at each of the organization's network boundaries.
13 Data Protection
Data Protection



5.3 Ensure that logging is enabled for Cloud storage buckets (Scored)"
  desc  "Storage Access Logging generates a log that contains access records
for each request made
    to the Storage bucket. An access log record contains details about the
request, such as the
    request type, the resources specified in the request worked, and the time
and date the
    request was processed. Cloud Storage offers access logs and storage logs in
the form of CSV
    files that can be downloaded and used for analysis/incident response.
Access logs provide
    information for all of the requests made on a specified bucket and are
created hourly, while
    the daily storage logs provide information about the storage consumption of
that bucket for
    the last day. The access logs and storage logs are automatically created as
new objects in a
    bucket that you specify. An access log record contains details about the
request, such as the
    request type, the resources specified in the request worked, and the time
and date the
    request was processed. While storage Logs helps to keep track the amount of
data stored in
    the bucket. It is recommended that storage Access Logs and Storage logs are
enabled for
    every Storage Bucket.
    By enabling access and storage logs on target Storage buckets, it is
possible to capture all
    events which may affect objects within target buckets. Configuring logs to
be placed in a
    separate bucket allows access to log information which can be useful in
security and
    incident response workflows.
    In most cases, Cloud Audit Logging is the recommended method for generating
logs that
    track API operations performed in Cloud Storage:  Cloud Audit Logging
tracks access on a continuous basis.  Cloud Audit Logging produces logs that
are easier to work with.  Cloud Audit Logging can monitor many of your Google
Cloud Platform services, not
    just Cloud Storage.
    In some cases, you may want to use access & storage logs instead.
    You most likely want to use access logs if:  You want to track access for
public objects.  You use Access Control Lists (ACLs) to control access to your
objects.
      You want to track changes made by the Object Lifecycle Management
feature.  You want your logs to include latency information, or the request and
response size
    of individual HTTP requests.
    You most likely want to use storage logs if:  You want to track the amount
of data stored in your buckets.

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
  tag check: "Using Gsutils:
1. To list all the buckets, run command: gsutil ls
2. For every bucket, to ensure if storage logging is enabled or not run command:
gsutil logging get gs://<bucketName>/
3. If output is\"gs://<bucketName>/ has no logging configuration.\"     ,
Storage
Access Logs and Storage logs are not enabled for a bucket.
4. Expected Output for a bucket with logging enabled: {\"logBucket\":
\"<bucketName
for a bucket used to store logs>\", \"logObjectPrefix\": \"<prefix set to
identify specific storage bucket logs, bucketName by default>\"}
"
  tag fix: "Using Gsutils:
To set Storage Access Logs and Storage logs for a bucket run:
gsutil logging set on -b gs://<bucketName for a bucket used to store logs>
gs://<your bucket name>
"
end

