MME_IP=`docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" prod-oai-mme`
SPGW0_IP=`docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" prod-oai-spgwc`
python3 ../component/oai-mme/ci-scripts/generateConfigFiles.py --kind=MME \
          --hss_s6a=192.168.61.2 --mme_s6a=192.168.61.3 \
          --mme_s1c_IP=192.168.61.3 --mme_s1c_name=eth0 \
          --mme_s10_IP=192.168.61.3 --mme_s10_name=eth0 \
          --mme_s11_IP=192.168.61.3 --mme_s11_name=eth0 --spgwc0_s11_IP=192.168.61.4 \
          --mcc=208 --mnc=93 --tac_list="5 6 7" --from_docker_file
docker cp ./mme-cfg.sh prod-oai-mme:/openair-mme/scripts
docker exec -it prod-oai-mme /bin/bash -c "cd /openair-mme/scripts && chmod 777 mme-cfg.sh && ./mme-cfg.sh"
