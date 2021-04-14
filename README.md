# Assuming you have docker image files
1. oai-hss (docker pull suyongeum/oai-hss)
2. oai-mme (docker pull suyongeum/oai-mme)
3. oai-spgwc (docker pull suyongeum/oai-spgwc)
4. oai-spgwu-tiny (docker pull suyongeum/oai-spgwu-tiny)
5. cassandra (docker pull suyongeum/oai-cassandra)

# First you need to run 
* run_container.sh
* it will create a container from each image

# Second configure each container by running
* each file includes parameters which you need to set each container 
1. set_config_cassdb.sh
2. set_config_hss.sh
3. set_config_mme.sh
4. set_config_spgwc.sh
5. set_config_spgwu-tiny.sh

# Third run each service
* launching_eps_tracing.sh

# Forth, stop each service
* stopping_eps_tracing.sh

# For cassandra,
* update users_imsi set opc='ec13982e55f14c648372257c0bfe2e42' where imsi='208930000039542';
* update users_imsi set key='5a100b3b174f85a9680472110103c0ac' where imsi='208930000039542';

### NO NEED -> update users_imsi set imei='864064041129587' where imsi='208930000039542';
