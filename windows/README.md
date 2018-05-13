# Specific windows instructions

With windows you can listen to network events with the taskmanager (Aufgabenplaner). There are two events (10000 and 10001) of type "Microsoft-Windows-NetworkProfile/Operational" that signal a connection to a network or a disconnection. Whenever such an event is fired, the script below is run once and restarts cntlm proxy.

## Files

### cntlm-restart.bat

This file is a batch script that kills a running cntlm instance, waits some time (waiting for network) and starts a new cntlm instance.

### network-proxytask.xml

This file is a task for the taskmanager (Aufgabenplaner) that can be imported. Before importing, the entry <command> has to be updated to the path where cntlm-restart.bat is located and checked out to.


