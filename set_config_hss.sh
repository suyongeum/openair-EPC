HSS_IP=`docker exec -it prod-oai-hss /bin/bash -c "ifconfig eth1 | grep inet" | sed -f ../ci-scripts/convertIpAddrFromIfconfig.sed`
python3 ../component/oai-hss/ci-scripts/generateConfigFiles.py --kind=HSS --cassandra=172.17.0.2 \
          --hss_s6a=192.168.61.2 --apn1=apn1.carrier.com --apn2=apn2.carrier.com \
          --users=200 --imsi=208930000039542 \
          --ltek=0c0a34601d4f07677303652c0462535b --op=63bfa50ee6523365ff14c1f45f88737d \
          --nb_mmes=1 --from_docker_file
docker cp ./hss-cfg.sh prod-oai-hss:/openair-hss/scripts
docker exec -it prod-oai-hss /bin/bash -c "cd /openair-hss/scripts && chmod 777 hss-cfg.sh && ./hss-cfg.sh"
