sudo rm blackscholes.ko
sudo rm .blackscholes.*
cp -r ../LinuxDriver ~/
cd ~/LinuxDriver
make
cd /shared/SNU_ESD/LinuxDriver
sudo cp -r ~/LinuxDriver /shared/SNU_ESD
rm -rf ~/LinuxDriver
