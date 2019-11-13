#!/bin/bash

source ~/.nvm/nvm.sh

cd opt && git clone -b dev https://github.com/tmobile/t-vault && cd t-vault && \
sed -i "s/#daemon.*.$/daemon off;/g" "dist/src/main/components/web/nginx/conf/nginx.conf" && \
sed -i "s/listen.*.$/listen 80;/g" "dist/src/main/components/web/nginx/conf/nginx.conf" && \
sed -i "s/ssl_certificate/#ssl_certificate/g" "dist/src/main/components/web/nginx/conf/nginx.conf" && \
sed -i "s/SKIP_SETCAP=.*.$/SKIP_SETCAP='true'/g" "dist/src/main/docker/parameter" && \
sed -i "s/^BACKEND=.*.$/BACKEND='Consul'/g" "dist/src/main/docker/parameter" && \
sed -i "s/CONSUL_RETRY_JOIN=.*.$/CONSUL_RETRY_JOIN='0.0.0.0'/g" "dist/src/main/docker/parameter" && \
sed -i '29 a admin_password=$1' "dist/src/main/docker/vault.sh" && \
sed -i '30 a consul_address=$2' "dist/src/main/docker/vault.sh" && \
sed -i "s/\$CONSUL_STORAGE_ADDRESS/\$consul_address/g" "dist/src/main/docker/vault.sh" && \
sed -i "s/password=safeadmin/password=\$admin_password/g" "dist/src/main/docker/vault.sh" && \
sed -i "s/\.\/vault\.sh*.$/\.\/vault\.sh \$1 \$2/g" "install_tvault.sh" && \
./build_tvault.sh --build all --package tar && sudo ./install_tvault.sh ${ADMIN_PASS} ${CONSUL_STORAGE_ADDRESS}
