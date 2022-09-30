# proxy needed for RocketChat to work with cron 
readonly https_proxy="https://someurl"
export https_proxy

print_timestamp() {
        now=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        echo -n "${now}"
}

set_mymessage() {
  mymessage="${messagelevel} $(print_timestamp) ${SCRIPT_NAME}: ${mytext}"
}

rocketchat_submit() {

        read -r -d '' payload << EOF
         {
          "username": "${1}",
          "icon_emoji": "${2}",
          "attachments": [ {
           "title": "${3}",
           "text": "${4}",
           "color": "${5}"
           } ]
         }
EOF

        curl -k -X POST -H "Content-type: application/json" \
        --data "${payload}" "${6}" >/dev/null 2>&1

error_check=$?

if [[ "${error_check}" != "0" ]]; then
  echo "Error with Rocketchat submit function, please investigate." >&2
fi
}

test() {
X=1

        if [ "$X" -eq "1" ]; then
         messagelevel="Alert"
         mytext="No file has been created in the past 4 hours"
         set_mymessage
         rocketchat_submit "GGtest" ":warning:" "test" "${mymessage}" "Amber" "https://rocketchat.dsa.homeoffice.gov.uk/hooks/beWDxrQkfvnxBXpRf/yKBPdkcHtGTaZK7QPzGcivZncCyvgYL6SufPM3mvjFDu248a"
         echo "${mymessage}" >&2
         exit 10
        fi

	}


echo "this code ran"
test
