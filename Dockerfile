#####################################################################################
# Product: ADempiere gRPC Access Server                                             #
# Copyright (C) 2012-2020 E.R.P. Consultores y Asociados, C.A.                      #
# Contributor(s): Edwin Betancourt EdwinBetanc0urt@outlook.com                      #
# This program is free software: you can redistribute it and/or modify              #
# it under the terms of the GNU General Public License as published by              #
# the Free Software Foundation, either version 3 of the License, or                 #
# (at your option) any later version.                                               #
# This program is distributed in the hope that it will be useful,                   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of                    #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                     #
# GNU General Public License for more details.                                      #
# You should have received a copy of the GNU General Public License                 #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.            #
#####################################################################################
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
