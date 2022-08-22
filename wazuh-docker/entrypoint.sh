#!/bin/bash
​
# Copyright (C) 2015-2021, Wazuh Inc.
# Created by Wazuh, Inc. .
# This program is a free software; you can redistribute it and/or modify it under the terms of GPLv2
​
pip3 install docker
​
echo "<ossec_config><wodle name=\"docker-listener\"><disabled>no</disabled></wodle></ossec_config>" >> /var/ossec/etc/ossec.conf
​
/var/ossec/bin/agent-auth -m 10.5.20.20 
sed -i 's/MANAGER_IP/10.5.20.20/g' /var/ossec/etc/ossec.conf
/var/ossec/bin/ossec-control restart 
​
sleep infinity
