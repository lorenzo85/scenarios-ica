FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done;
bash ${FILE}
source ${HOME}/.bashrc
echo "Configuration loaded."
