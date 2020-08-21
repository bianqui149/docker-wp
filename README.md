# docker-wp
Complete docker-compose file
Simple docker compose file, to get an complete environmente of wp, mysql, phpmyadmin.
To run wp cli command execute this "docker-compose run --rm wpcli plugin list".
Or create an alias 
cd $HOME
$  vi .bash_profile
alias wp="docker-compose run --rm wpcli"

chmod +x ./export.sh
