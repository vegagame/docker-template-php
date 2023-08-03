# Docker Template For Php 8.1

## Requirement
Make sure to have:
- aws cli : `ls  ~/.aws`
If not install it and configure: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

-  **mkcert** (https://github.com/FiloSottile/mkcert) e **docker/docker-compose**.

## Configuration

Make sure `configure.sh` is executable with `chmod u+x configure.sh`

Exec command `bash configure.sh` and insert:

- Local site host eg: `domain.localhost`
- Network and project name eg: `my-project`
- Github eg: `ghp_xxx`


## Info
The application will be available in dir `app`


### To start the environment:
```
docker-compose  up -d
```

### To stop the environment:
```
docker-compose  down
```

### To exec command:
```
docker exec -w /var/www test-docker_php_1 php bin/console 
```

### Navigtion

```
https://yourdomain.localhost/
```
