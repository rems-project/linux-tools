#!/bin/zsh
. ${0:a:h:h}/config.sh

DIR=${0:a:h}
ROOT=${0:a:h:h:h}

${CONFIG_CROSS_COMPILE_PREFIX}objcopy --only-keep-debug ${ROOT}/vmlinux ${DIR}/kernel-pkvm.sym
cd ${DIR}
${CONFIG_CROSS_COMPILE_PREFIX}gdb -x setup.gdb
