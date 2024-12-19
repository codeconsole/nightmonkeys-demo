FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    fontconfig \
    libheif-dev \
    libwebp-dev \
    libjxl-dev

RUN apt-get install -y wget gnupg \
    && wget -q -O - https://download.bell-sw.com/pki/GPG-KEY-bellsoft | apt-key add - \
    && echo "deb [arch=amd64] https://apt.bell-sw.com/ stable main" > /etc/apt/sources.list.d/bellsoft.list \
    && apt-get update \
    && apt-get install -y bellsoft-java23-runtime

ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib/x86_64-linux-gnu"

WORKDIR /app

COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["sh", "-c", "java --enable-native-access=ALL-UNNAMED --enable-preview $JAVA_OPTS -jar app.jar"]
