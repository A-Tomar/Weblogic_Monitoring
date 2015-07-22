import time
import sys,re,os
from java.lang import Thread
from time import gmtime, strftime
import getopt
xDomain = 'domain'
try:
    opts, args = getopt.getopt( sys.argv[1:], "u:p:h:t:", ["xusername","xpassword","xurl","xTime"] )
except getopt.GetoptError, err:
    print str(err)
    usage()
    sys.exit(2)

#===== Handling get options  ===============
for opt, arg in opts:
    if opt == "-u":
        xusername = arg
    elif opt == "-p":
        xpassword = arg
    elif opt == "-h":
        xurl  = arg
    elif opt == "-t":
        xTime  = arg
aTime = strftime('%b_%d_%Y')
State_outputFile = open(str(xDomain) + 'ServerMonitoring_' + str(xTime) +'.txt', 'w')


try:
        connect(xusername,xpassword,xurl)
        domainConfig()
        xManageServers = cmo.getServers()
        domainRuntime()
except:
        State_outputFile.writelines('An Error Occorred:Unable to connect to console, either it is down or invalid credentials')
        State_outputFile.writelines('\n')
        connectionException = 1
        exit()

try:
        for server in xManageServers:
                cd("/ServerLifeCycleRuntimes/" + server.getName())
                xServerName = cmo.getName()
                xServerState = cmo.getState()
                State_outputFile.writelines('%s %s' %(xServerName,xServerState))
                State_outputFile.writelines('\n')

except:
        print "Server is not running."
        State_outputFile.writelines('An Error occured Please check manually')

State_outputFile.close()
disconnect()
