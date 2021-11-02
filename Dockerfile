FROM windsekirun/jenkins-android-docker:1.1.4
LABEL maintainer="dosunyun@vanillabrain.com"

RUN sdkmanager --sdk_root=/opt/android-sdk-linux --update
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "cmdline-tools;latest"
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "build-tools;31.0.0" "platforms;android-31"

# Flutter 설치 - 참고 : https://github.com/GoogleCloudPlatform/cloud-builders-community/blob/770e0e9623b8556643badd69a170809e93731cf1/flutter/Dockerfile
ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin
USER root
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_HOME}"

# analytics and crash reporting 은 빌드시 필요없음
RUN flutter config  --no-analytics
# artifact precache 하여 추가 다운로드를 안하도록함
RUN flutter precache
# 라이센스 허가
RUN yes "y" | flutter doctor --android-licenses
## flutter doctor 실행
RUN flutter doctor -v
## flutter upgrade 실행
RUN flutter upgrade
