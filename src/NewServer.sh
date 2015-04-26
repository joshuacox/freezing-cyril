#!/bin/bash
#mkdir /mnt/$1
if [ $# -ne 2 ]; then
        # Print usage
        echo 'wrong!!! bad operator!!!
        usage:
        NewServer.sh SERVERNAME IPADDRESS|HOSTNAME
        e.g.
        NewServer.sh Saruman 65.67.51.189
        '
            exit 1
fi
echo "
my Name is $1 and my IP address is $2
I will now complete these commands:
mkdir /mnt/$1
and make these scripts
/usr/local/bin/$1
/usr/local/bin/Mount$1
"

mkdir /mnt/$1
echo "#!/bin/bash
sshfs -p 16222 root@$2:/ /mnt/$1
">/usr/local/bin/Mount$1
chmod +x /usr/local/bin/Mount$1
echo "#!/bin/bash
ssh -p 16222 root@$2 \$@
">/usr/local/bin/$1
chmod +x /usr/local/bin/$1
