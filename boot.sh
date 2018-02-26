#!/bin/bash
if [ ! -z "$ES_HOST" ]; then
  sed -i 's/localhost/'$ES_HOST'/' /opt/diskover-web/src/diskover/Constants.php
fi
exec /usr/bin/supervisord

#supervisord.conf
[supervisord]
nodaemon = true
