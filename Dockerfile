FROM bellsoft/liberica-openjdk-alpine-musl:23

RUN apk update

RUN apk --no-cache add \
    libheif-dev \
    x265 \
    libwebp-dev \
    libjxl-dev \
    fontconfig

WORKDIR /app

COPY build/libs/nightmonkeys-demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["sh", "-c", "java -Djava.library.path=/usr/lib --enable-native-access=ALL-UNNAMED --enable-preview $JAVA_OPTS -jar app.jar"]
