#!/bin/sh
docker exec -it soc-ap_kibana_1 "echo -e \"\nxpack.encryptedSavedObjects.encryptionKey: 'dR8AGqIPzGWpRUbv5uV5TTDUpoU81iQL'\" >> /usr/share/kibana/config/kibana.yml"
docker restart soc-ap_kibana_1