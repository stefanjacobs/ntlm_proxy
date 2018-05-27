#!/bin/bash

# wait for network to fully come up - needed with macos? I am not sure?..
sleep 5

# first restart squid
brew services restart squid

# second restart cntlm
brew services restart cntlm

# inform user that action happened.
osascript -e 'tell app "System Events" to display dialog "Restarted Proxies"'

