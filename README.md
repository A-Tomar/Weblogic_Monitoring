# weblogic
wlst scripts

- Use this script to get Weblogic Server Status in realtime.
- You can use this script from within a script to check status for any number of weblogic Environments.
- To do that, just list consoles details along with user/password in a text file, then parse those details put those in variables using a wrapper script & call this .ksh with the arguments
- You can set it up  in crontab to monitor the same periodically and send alerts to operations whenever a JVM is down.
