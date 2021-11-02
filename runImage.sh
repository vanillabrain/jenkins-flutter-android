mkdir -p ./data/jenkins-flutter-android
docker run -d --name jenkins-flutter-android -p 8080:8080 -p 50000:50000 -v ./data/jenkins-flutter-android:/var/jenkins_home vanillabrain/jenkins-flutter-android:1.1.4 .
