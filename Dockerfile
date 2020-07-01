FROM openjdk:8-jre-alpine

LABEL maintainer="EdwinBetanc0urt@outlook.com" \
	description="ADempiere gRPC Acceser Server"

ENV URL_REPO="https://github.com/erpcya/adempiere-gRPC-Server" \
	VERSION="rt-13.3" \
	BINARY_NAME="adempiere-gRPC-Server.zip"

WORKDIR /opt/Apps/

RUN echo "Install needed packages..." && \
	apk --no-cache add curl && \
	echo "Get gRPC Acceser Server Binary Release:${VERSION}..." && \
	curl --output "$BINARY_NAME" -L "$URL_REPO/releases/download/$VERSION/$BINARY_NAME" && \
	echo "Uncompress release file..." && \
	unzip -o $BINARY_NAME && \
	mv adempiere-gRPC-Server ADempiere-gRPC-Server && \
	rm $BINARY_NAME

# Add connection template
COPY access_connection.yaml /opt/Apps/ADempiere-gRPC-Server/bin/access_connection.yaml

WORKDIR /opt/Apps/ADempiere-gRPC-Server/bin/

CMD 'sh' 'adempiere-access-server' 'access_connection.yaml'
