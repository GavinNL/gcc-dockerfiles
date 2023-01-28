# Conan-DockerFiles (Podman)

These are some docker files that I am using to build Docker/Podman images for various C++ builds.

These images are adapated from https://github.com/conan-io/conan-docker-tools

There is single script that can be used to build all the images

```
./build_all.sh
```

# Installing Podman
Follow the instructions on this page to install podman on ubuntu 18.04
  
https://www.techrepublic.com/article/how-to-install-podman-on-ubuntu/

# Installing Dependencies

Install the following packages:

```bash
sudo apt install buildah runc
```
