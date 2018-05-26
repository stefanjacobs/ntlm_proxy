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

Everything should be working by now.

## When network changes occur

Cntlm Proxy has to be restarted, when network changes occur. That can be done using the networkchange.plist file. Edit the file and point it to the networkchange.sh location. After that, execute

    launchctl load networkchange.plist
    launchctl start networkchange

