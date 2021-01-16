ADempiere Access gRPC Docker Server
=====================

#### @DEPRECATED Replace with https://github.com/adempiere/adempiere-grpc-all-in-one-docker

[Docker](https://www.docker.io/) file for trusted builds of [ADempiere gRPC Deploy](http://erpya.com/) on https://hub.docker.com/r/erpya/adempiere-grpc-access.

You will need use a file with a structure like it: [access_connection.yaml](access_connection.yaml)
```yaml

server:
    port: 50050
database:
    host: localhost
    port: 5432
    name: "database"
    user: adempiere
    password: adempiere
    type: PostgreSQL
```

Run the latest container with:
```shell
    docker pull erpya/adempiere-grpc-access
```

```shell
docker run --name adempiere-grpc-access -it \
	-p 50050:50050 \
	-v $(pwd)/access_connection.yaml:/opt/Apps/ADempiere-gRPC-Server/bin/access_connection.yaml \
	erpya/adempiere-grpc-access
```
