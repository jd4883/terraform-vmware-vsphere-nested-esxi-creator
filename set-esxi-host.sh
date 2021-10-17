#!/bin/sh
set -o errexit
esxcli system settings advanced  set -o /UserVars/HostClientCEIPOptIn -i 2
esxcli system settings advanced  set -o /UserVars/SuppressShellWarning -i 1
esxcli system settings advanced  set -o /UserVars/SuppressHyperthreadWarning -i 1
esxcli system settings advanced  set -o /UserVars/SuppressCoredumpWarning -i 1
esxcli system settings advanced  set -o /UserVars/SuppressCoredumpWarning -i 1
esxcli system settings advanced  set -o /UserVars/DcuiTimeOut -i 0
