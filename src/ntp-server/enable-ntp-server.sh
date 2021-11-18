#!/bin/bash

# Independent of the network instance chronyd is running in
CONF_FILE="/etc/mntp.conf"

cat >> $CONF_FILE < EOF
# Added by srl-ntp-server agent script; allow clients from any ipv4/v6 address
allow
# end added
EOF

# Restart chronyd
kill -hup `pidof chronyd`

exit $?
