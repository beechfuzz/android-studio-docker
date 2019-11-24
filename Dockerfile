FROM adoptopenjdk/openjdk8:alpine

RUN apk add --no-cache --update curl unzip coreutils openjdk8-jre && \
    \
    echo '#### DOWNLOADING ANDROID STUDIO ####' && \
    curl -fsSL https://dl.google.com/dl/android/studio/ide-zips/3.5.2.0/android-studio-ide-191.5977832-linux.tar.gz -o /tmp/studio.tar.gz && \
    \
    echo '#### INSTALLING ANDROID STUDIO ####' && \
    mkdir -p /opt/android-studio && \
    tar xzf /tmp/studio.tar.gz -C /opt && \
    rm -rf /tmp/*

CMD /opt/android-studio/bin/studio.sh

