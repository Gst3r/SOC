#!/bin/sh

docker cp /home/adminuser/custom-w2thive.py wazuh.manager:/var/ossec/integrations/custom-w2thive.py
docker cp /home/adminuser/custom-w2thive wazuh.manager:/var/ossec/integrations/custom-w2thive
docker exec -it wazuh.manager sh -c "/var/ossec/framework/python/bin/pip3 install thehive4py==1.8.1 && chown root:wazuh custom-*"
docker restart wazuh.manager