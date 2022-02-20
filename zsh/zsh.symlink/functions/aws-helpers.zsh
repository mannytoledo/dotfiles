awsip2id() {
  aws ec2 describe-instances --filter="Name=private-ip-address,Values=${1}" --query 'Reservations[].Instances[].InstanceId' --output text
}

awsid2ip() {
  aws ec2 describe-instances --instance-id ${1} --query 'Reservations[].Instances[].PrivateIpAddress' --output text
}

awsstatusfromip() {
  aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --filter="Name=private-ip-address,Values=${1}" --query 'Reservations[].Instances[].InstanceId' --output text)
}

awsssh2id() {
  ssh $(aws ec2 describe-instances --instance-id ${1} --query 'Reservations[].Instances[].PrivateIpAddress' --output text)
}

awsid2name() {
  aws ec2 describe-instances --instance-id ${1} --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[]]' --output text
}

awscountbyname() {
  if command -v gsed >/dev/null;then
    aws ec2 describe-instances --query 'Reservations[].Instances[].Tags[?Key==`Name`].Value[]' --output text | gsed -E -e 's/[[:blank:]]+/\n/g' | sort | uniq -c
  else
    echo "You need to have gsed installed. Run 'brew install gnu-sed'. Aborting."
  fi
}


awscountbynametype() {
  if command -v gsed >/dev/null;then
    aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[],InstanceType]' --output text| awk 'NR%2{printf "%s ",$0;next;}1'|awk '{print $2 " " $1}'| sort | uniq -c
  else
    echo "You need to have gsed installed. Run 'brew install gnu-sed'. Aborting."
  fi
}

awslistinstances() {
  aws ec2 --region us-west-2 describe-instances \
    --filter Name=tag-key,Values=Name \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output text
  }

awslistcodebuildprojects() {
  aws --region us-west-2 codebuild list-projects --query "projects[?!starts_with(@, \`Ethos-SRE-Test\`)]"
}

klamsh() {
  klam login
  $(klam credentials --profile "${1}" -o bash)
}

