#!/bin/bash

# Alternatively, rewrite /opt/srlinux/appmgr/sr_linux_mgr_config.yml
# to modify launch-command for chronyd

# Independent of the network instance chronyd is running in
CONF_FILE="/etc/mntp.conf"

# Wait until config is created and written
if [[ -f $CONF_FILE ]]; then
  # Added by srl-ntp-server agent script; allow clients from any ipv4/v6 address
  grep allow $CONF_FILE || echo -e "\n#added by ntp-server\nallow\n" >> $CONF_FILE

  # Restart chronyd
  kill -hup `pidof chronyd`

  exit $?
else
  exit 0
fi
