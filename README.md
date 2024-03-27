# rust-flutter-jni-lib

# 1. Buildez le projet rust
```bash
cd hello-hack-congo
cargo ndk -t armeabi-v7a -o ./jniLibs build 
cargo ndk -t arm64-v8a -o ./jniLibs build
```

# 2. Copiez le fichier .so dans le dossier android/app/src/main/jniLibs
```bash
cp -r ./jniLibs/* ../hello_hack_congo/android/app/src/main/jniLibs
```

# 3. Buildez le projet flutter
```bash
cd ../hello_hack_congo
flutter build apk
```

# 4. Installez l'apk sur votre téléphone
```bash
flutter install
```

# 5. Lancez l'application
```bash
flutter run
```