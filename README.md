# jenkins-flutter-android
Docker Image for Jenkins Flutter Android Build, [View on DockerHub](https://hub.docker.com/r/vanillabrain/jenkins-flutter-android)

## Pre-installed packages
 * Jenkins Version: 2.266
 * Docker-CE

### Flutter SDK
 * Recent Stable Version - from git

### Android SDK
 * Android API 31 - build tools 31.0.0
 * Android API 30 - build tools 30.0.02 (1.1.3)
 * Android API 29 - build tools 29.0.2 (1.0.8)
 * Android API 28 - build tools 28.0.3
 * Android API 27 - build tools 27.0.3
 * Android API 26 - build tools 26.0.3
 * Android API 25 - build tools 25.0.3 (1.0.2)
 * Android API 23 - build tools 23.0.3 (1.0.2)
 * extra-android-m2repository
 
### Jenkins Plugin
 * git
 * gradle
 * android-emulator
 * ws-cleanup
 * slack
 * embeddable-build-status
 * blueocean (1.0.4)
 * github-coverage-reporter (1.0.4)
 * jacoco (1.0.4)
 * github-pr-coverage-status (1.0.4)
 * locale (1.0.6)
  
## Build image
```docker build -t jenkins-flutter-android .```

## Using image
```docker run -d -p 8080:8080 -p 50000:50000 -v /data/jenkins-flutter-android:/var/jenkins_home vanillabrain/jenkins-flutter-android:<latest-version>```

 - Latest version need to replace real version. You can find tag in [Release Page](https://github.com/vanillabrain/jenkins-flutter-android/releases)
 - Before run image, you should provide permission to access /data/jenkins-android-docker with ```sudo chown -R 1000:1000 /data/jenkins-android-docker``` statement.

### docker-compose
```
  jenkins:
    image: vanillabrain/jenkins-flutter-android:<latest-version>
    container_name: jenkins
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - "/data/jenkins-flutter-android:/var/jenkins_home"
      - "/var/run/docker.sock:/var/run/docker.sock"
    restart: always
```

### With nginx
If you want use nginx for reverse-proxy, you can add this statement in conf file.
```proxy_pass http://jenkins:8080;```

## Modification
 From Line 33 ~ 41, you can modify version info using `sdkmanager`. Feel free to change these value.
