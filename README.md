# Proxy Setup for BKU and at Home

When using CNTLM, Squid and VPN you are in to a lot of fun. It might work without some user interference, but when you are about to change networks, e.g. starting up laptop at home, connecting to the wireless and connecting to VPN, it was impossible for me to get a working setup without manual intervention. Because manual work always means error (and that I experienced a log on my own ;-) ), I created a solution that solves the mentiond problems without manual rework.

## General idea

CNTLM ist the endpoint for all local applications. It is running on port 3128 locally. It has two proxys under the hood - first one is the NTLM Proxy, second one is a local squid. The local squid listens on port 3129 and its only job is to connect to the internet in a non NTLM setup. When configured correctly the proxy work flawlessly together, but network changes do not change anything on the proxies. This solution here listens for network change events and restarts the cntlm proxy.

## Files

### cntlm.ini

There are only two interesting settings in [cntlm.ini](./cntlm.ini). See Proxy entries, change Username/Domain and generate correct PassNTLMv2 hash.

### squid.conf

Only one interesting setting in [squid.conf](./squid.conf). See http_port, that is set to 3129 instead of 3128. If you like, change nameservers.

## Windows Installation

See [Windows](/windows) instructions.

## Mac Installation

See [Mac](/mac) instructions (TODO).

## Linux Installation

See [Linux](/linux) instructions (TODO).

## Links

Inspiration

* [How to run a script when network changes](https://serverfault.com/questions/26056/how-can-i-run-a-script-when-my-network-connection-changes)
* [Signal when network connection disconnects](https://superuser.com/questions/262799/how-to-launch-a-command-on-network-connection-disconnection)

Sources

* [CNTLM](http://cntlm.sourceforge.net/)
* [Squid](https://wiki.squid-cache.org/SquidFaq/BinaryPackages)

## Possible improvements

* Windows: Exchange CNTLM with [PX Proxy](https://github.com/genotrance/px). The PX Proxy uses the logged in windows user, so no credentials that have to be taken care of..

## License

Creative Commons Attribution 4.0, see [License](./LICENSE).
