# Specific Mac Instructions

I assume that you are using (Homebrew)[https://formulae.brew.sh/]. You probably already got the idea to install squid and cntlm. If not, do so by

    brew install cntlm
    brew install squid

Edit both configuration files and have a look at the given examples in this repository

    vi /etc/local/cntlm.conf
    vi /etc/local/squid.conf

After changing both config files, start both services using

    brew services start cntlm
    brew services start squid

Everything should be working by now. Go to system settings and point the proxy to localhost:3128 and test with your browser, if everything is working.

## When network changes occur

Cntlm Proxy has to be restarted, when network changes occur. That can be done using the networkchange.plist file. Edit the file and point it to the networkchange.sh location, e.g. /User/Shared/bin. After that, put the file to

    /Library/LaunchAgent/networkchange.plist

After rebooting, everything should work by now. Disconnecting and Reconnecting WiFi should execute the script.

## Files

### networkchange.sh

First sleep some time, then restart squid (so that cntlm finds the upward proxy, if needed), after that restart cntlm. If unsure, uncomment the message that will alert the user. Put the file ideally to /User/Shared/bin

### networkchange.plist

The files contains a list of resolv.conf files that is edited as soon as network config changes. If that happens, the configured files is executed. Put the file ideally to /Library/LaunchAgent/networkchange.plist. That is used to execute the shell script every time, the network changes.
