#!/bin/bash

#switch to correct working dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${DIR}"

# give a hint that proxies are restarted
/usr/bin/osascript -e 'display notification "Network change detected, restarting..." with title "Proxies"'

/usr/local/bin/brew services restart squid
/usr/local/bin/brew services restart cntlm

result=$?
if [ "$result" -eq 0 ]; then
  /usr/bin/osascript -e 'display notification "Restarting succeeded" with title "Proxies"'
else
  /usr/bin/osascript -e 'tell app "System Events" to display dialog "Proxy restarting failed -> '"${result//\"/}"' - (0) is success"'
fi
