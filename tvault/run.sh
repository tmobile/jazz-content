#!/bin/bash

source ~/.nvm/nvm.sh
cd opt && git clone -b tvault_docker https://github.com/rajeevr2715/t-vault && cd t-vault &&./build_tvault.sh --build all --package tar && sudo ./install_tvault.sh ${ADMIN_PASS} ${CONSUL_STORAGE_ADDRESS}
