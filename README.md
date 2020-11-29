# OpenCV installation scripts for Raspberry Pi


## Getting started

- ### Clone the repository
```
git clone git@github.com:MayurDeshmukh10/opencv-installation-scripts.git
cd opencv-installation-scripts
sudo chmod +x *.sh
```

- ### Download OpenCV version of your choice
Change ```OPENCV_VERSION=``` value to required version in ```download_opencv.sh``` and then 
```
./download_opencv.sh
```

- ### Install dependencies required by OpenCV
```
./install_dependencies.sh
```
- ### Build, Compile and Install OpenCV
```
./build_opencv.sh
```
