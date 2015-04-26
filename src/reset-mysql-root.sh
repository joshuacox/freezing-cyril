#!/bin/sh
#
#  Reset the root password of an MySQL server.  Usage:
#
#   ./reset-mysql-root.sh new-password-here
#
# Steve
# --
# $Id: reset-mysql-root.sh,v 1.1 2006/09/27 14:56:27 steve Exp $
#



#
# Make sure we got a password on the command line.
#
if [ -z "$1" ]; then
    echo "Usage: $0 new-password-value";
    exit
fi



#
# Make sure we're running as root, since we need to stop/start MySQL.
#
if [ "$EUID" -ne "0" ]; then
    echo "Must be root to run this script"
    exit
fi



#
# Stop the MySQL server
#
/etc/init.d/mysql stop



#
# Make sure it was stopped successfully.
#
if ( ps -ef | grep [m]ysqld 2>/dev/null >/dev/null ); then
    echo "MySQL failed to stop.  Aborting."
    exit
fi



#
# Start up a copy without the privilege checking
#
/usr/bin/mysqld_safe --skip-grant-tables  >/dev/null 2>/dev/null &
echo "Sleeping to allow server to start: 5 seconds"

#
# Wait for it to be ready
#
echo -n "Waiting for server to start "
for i in `seq 1 10`; do 
    echo -n "${i} "
    sleep 1
done
echo -e " ...\n"


#
# Get the PID
#
pid=$!



#
# Now reset the root password.
#
mysql -h localhost -u root mysql -e "update user set Password=PASSWORD('$1') WHERE User='root'"
mysql -h localhost -u root mysql -e "flush privileges"



#
#  Kill the server we started, and start the real one.
#
kill -9 "${pid}"
/etc/init.d/mysql start

echo -e "\n\nPassword reset to $1\n\n"
