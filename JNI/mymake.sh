sudo rm -rf libs
rm -rf /android/android-ndk-r5b/apps/blackscholes
cp -r ../JNI /android/android-ndk-r5b/apps
mv /android/android-ndk-r5b/apps/JNI /android/android-ndk-r5b/apps/blackscholes
cd /android/android-ndk-r5b
make APP=blackscholes
sudo cp -r /android/android-ndk-r5b/apps/blackscholes/project/libs /shared/SNU_ESD/JNI
cd /shared/SNU_ESD/JNI
