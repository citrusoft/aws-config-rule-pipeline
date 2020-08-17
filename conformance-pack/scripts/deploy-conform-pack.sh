#!/bin/bash
set -x # trace on
ConformancePack=RemediateOverlyPermissiveSGIngressRule
MasterProfile=PGE-Master
MasterAccountID=739846873405
region=us-west-2
S3Bucket4ConformancePack=popkorn
MemberAccounts="941660151382 932003862618 868907362424 654839913762 523994389869 477027688362 338797489773 190530070448 119224919700"
MemberProfiles="PGE-ARAD-Test PGE-CustomerCare-Test PGE-EmergencyWeb-Test PGE-PSPS-Test PGE-LocateAndMark-Test PGE-SecureByDesign-Test PGE-EnterpriseIntegration-Test PGE-IntSharedWorkload-Test PGE-SIPTSch-Test"

# for i in `echo $MemberProfiles`
# do
aws configservice put-organization-conformance-pack --organization-conformance-pack-name=${ConformancePack} \
  --template-body=file://SecurityGroupConformancePack.yaml --delivery-s3-bucket=${S3Bucket4ConformancePack} \
  --conformance-pack-input-parameters=ParameterName=SecurityGroupMaskLambdaArn,ParameterValue="arn:aws:lambda:${region}:${MasterAccountID}:function:ConformancePackSecurityGroup" \
  --profile ${MasterProfile}
# break
# done