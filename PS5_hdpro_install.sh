mkdir -p ~/src/ps5_hdpro
cd ~/src/ps5_hdpro
git clone https://github.com/Hackinside/PS5_camera_files
git clone https://github.com/raleighlittles/PS5-Camera-Firmware-Loader
git clone https://github.com/sieuwe1/PS4-eye-camera-for-linux-with-python-and-OpenCV.git
sudo cp ~/src/ps5_hdpro/PS5_camera_files/firmware.bin /lib/firmware/ps5_hdpro.bin
cd PS5-Camera-Firmware-Loader
sudo cp 100-playstation-camera.rules /etc/udev/rules.d/
sudo udevadm control --reload
sudo udevadm trigger
cd cpp
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install cmake

cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 20)


cmake CMakeLists.txt
make

sudo cp ./ps5_camera_firmware_loader /usr/bin/
echo "ps5_camera_firmware_loader /lib/firmware/ps5_hdpro.bin " > ./ps5_hdpro_start.sh
sudo mv ./ps5_hdpro_start.sh /usr/bin/
sudo chmod +x /usr/bin/ps5_hdpro_start.sh
ps5_hdpro_start.sh

git clone https://github.com/sieuwe1/PS4-eye-camera-for-linux-with-python-and-OpenCV.git
