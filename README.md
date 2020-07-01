ADempiere Access gRPC Docker Server
=====================

[Docker](https://www.docker.io/) file for trusted builds of [ADempiere gRPC Deploy](http://erpya.com/) on https://hub.docker.com/r/erpya/adempiere-grpc-access.

Run the latest container with:

    docker pull erpya/adempiere-grpc-access


```shell
docker run --name adempiere-grpc-access -it \
	-p 50050:50050 \
	-v $(pwd)/access_connection.yaml:/opt/Apps/ADempiere-gRPC-Server/bin/access_connection.yaml \
	erpya/adempiere-grpc-access
```
