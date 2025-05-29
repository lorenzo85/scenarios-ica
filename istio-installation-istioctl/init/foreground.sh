FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}

# Kubectl alias
echo "alias k='kubectl'" >> ~/.bashrc
source ${HOME}/.bashrc

clear
echo "Scenario is ready"