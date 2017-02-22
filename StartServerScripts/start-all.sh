screen -S apigateway /root/run_scripts/gateway/start-apigateway.sh

screen -S account /root/run_scripts/rpc_servers/start-account.sh
screen -S edcenter /root/run_scripts/rpc_servers/start-edcenter.sh
screen -S i18n /root/run_scripts/rpc_servers/start-i18n.sh
screen -S member /root/run_scripts/rpc_servers/start-member.sh
screen -S sms /root/run_scripts/rpc_servers/start-sms.sh
screen -S sso /root/run_scripts/rpc_servers/start-sso.sh

