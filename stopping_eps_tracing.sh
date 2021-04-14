docker exec -it prod-oai-hss /bin/bash -c "killall --signal SIGINT oai_hss tshark"
docker exec -it prod-oai-mme /bin/bash -c "killall --signal SIGINT oai_mme tshark"
docker exec -it prod-oai-spgwc /bin/bash -c "killall --signal SIGINT oai_spgwc tshark"
docker exec -it prod-oai-spgwu-tiny /bin/bash -c "killall --signal SIGINT oai_spgwu tshark"
sleep 10
docker exec -it prod-oai-hss /bin/bash -c "killall --signal SIGKILL oai_hss tshark"
docker exec -it prod-oai-mme /bin/bash -c "killall --signal SIGKILL oai_mme tshark"
docker exec -it prod-oai-spgwc /bin/bash -c "killall --signal SIGKILL oai_spgwc tshark"
docker exec -it prod-oai-spgwu-tiny /bin/bash -c "killall --signal SIGKILL oai_spgwu tshark"
