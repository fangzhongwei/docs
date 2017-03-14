sudo screen -S apigateway /home/ec2-user/run_scripts/start/start-apigateway.sh
sudo screen -S gamegateway /home/ec2-user/run_scripts/start/start-gamegateway.sh

sudo screen -S account /home/ec2-user/run_scripts/start/start-account.sh
sudo screen -S edcenter /home/ec2-user/run_scripts/start/start-edcenter.sh
sudo screen -S i18n /home/ec2-user/run_scripts/start/start-i18n.sh
sudo screen -S member /home/ec2-user/run_scripts/start/start-member.sh
sudo screen -S sms /home/ec2-user/run_scripts/start/start-sms.sh
sudo screen -S sso /home/ec2-user/run_scripts/start/start-sso.sh
sudo screen -S gamecenter /home/ec2-user/run_scripts/start/start-gamecenter.sh

