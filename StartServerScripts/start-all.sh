screen -S apigateway /home/ec2-user/run_scripts/start/start-apigateway.sh
screen -S gamegateway /home/ec2-user/run_scripts/start/start-gamegateway.sh

screen -S account /home/ec2-user/run_scripts/start/start-account.sh
screen -S edcenter /home/ec2-user/run_scripts/start/start-edcenter.sh
screen -S i18n /home/ec2-user/run_scripts/start/start-i18n.sh
screen -S member /home/ec2-user/run_scripts/start/start-member.sh
screen -S sms /home/ec2-user/run_scripts/start/start-sms.sh
screen -S sso /home/ec2-user/run_scripts/start/start-sso.sh
screen -S gamecenter /home/ec2-user/run_scripts/start/start-gamecenter.sh

