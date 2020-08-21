# docker-wp
Docker enviroment, to get an complete environmente of wp, mysql, phpmyadmin. wpcli and xdebug. 

## Installation

```bash
docker-compose up -d
```

## Usage

```wp cli
wp cli

docker-compose run --rm wpcli plugin list
alias cd $HOME $ vi .bash_profile alias wp="docker-compose run --rm wpcli"
```
```export.sh
database
Execute from the command line ./export.sh to get a mysqldump of the project
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
