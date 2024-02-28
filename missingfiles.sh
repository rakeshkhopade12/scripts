#!/bin/bash
set  -x
sent_teams() {
local teams_webhook="https://subudiscoverdollar.webhook.office.com/webhookb2/9de83426-c3e9-4bcb-8f17-245973893f28@152e5724-295e-4541-8b3b-9b6ce1a31927/IncomingWebhook/5ce8d09cb0f3447f8f386c8abdc3f324/6d8c0384-cfb7-438a-a6f3-1ece01fe431d"
local message="$1"
 curl -H "Content-Type: application/json" -d "{\"text\":\"$message\"}" "$teams_webhook" >/dev/null 2>&1
}
folder_path="/home/rakesh/terraform"
expectedfiles=("provider.tf" "terraform.tfvars")
missing_files=""
for file in "${expectedfiles[@]}"; do
if [ ! -f "$folder_path/$file" ]; then
	missing_files+="$file"
fi
done
if [ -n "missing_files" ]; then
	message="missing file in folder $folder_path is $missing_files"



sent_teams "$message"
fi

