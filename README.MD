# Stand up microservices
This repository contains scripts for standing up all `e-ducation` microservices.

In order to setup the required folders and files to run the microservices, please run:

```
$ ./setup.sh
```
To update the application code and re-built the containers at a later point, run:
```
$ ./update.sh
```

## Management services provided by the docker-compose script within this repo
This repository provides interfaces for managing the `postgres` and `couchdb` databases that are brought up by the `docker-compose` file within it. They are accessible at:

* For `couchDB` - http://localhost:5984/_utils/#login - the default username and password are `admin`/`password`
* For `Postgres` - http://localhost:5080/