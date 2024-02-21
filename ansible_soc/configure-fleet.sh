#!/bin/bash
docker exec -it es02 sh -c './bin/elasticsearch-certutil cert   --name fleet-server   --ca-cert /usr/share/elasticsearch/config/certs/ca/ca.crt   --ca-key /usr/share/elasticsearch/config/certs/ca/ca.key   --pem --out=certificate-bundle.zip'
docker exec -u root -it es02 unzip certificate-bundle.zip -d ./config/certs/