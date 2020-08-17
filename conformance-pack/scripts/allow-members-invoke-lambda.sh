#!/bin/bash
MasterProfile=PGE-Master
MasterAccountID=739846873405
region=us-west-2
S3-bucket-for-conformance-pack=popkorn
MemberAccounts="941660151382 932003862618 868907362424 654839913762 523994389869 477027688362 338797489773 190530070448 119224919700"
MemberProfiles="PGE-ARAD-Test PGE-CustomerCare-Test PGE-EmergencyWeb-Test PGE-PSPS-Test PGE-LocateAndMark-Test PGE-SecureByDesign-Test PGE-EnterpriseIntegration-Test PGE-IntSharedWorkload-Test PGE-SIPTSch-Test"
for i in `echo $MemberAccounts`
do
aws lambda add-permission --function-name AutomationSecurityGroupConformance \
  --statement-id "AllowExecutionFromAutomation${i}" --action "lambda:InvokeFunction" \
  --principal "arn:aws:iam::${i}:role/AutomationRole" \
  --profile $MasterProfile
done
