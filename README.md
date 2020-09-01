# Conan-DockerFiles

These are just some docker files that I am using to build Docker images for various C++ builds.

These images are adapated from https://github.com/conan-io/conan-docker-tools


```
cd bionic-gcc7
docker build -t ubuntu1804gcc:Dockerfile .


cd ../gocal-gcc9
docker build -t ubuntu1804gcc:Dockerfile .
```


# .bashrc

These functions are added to my `.bashrc` file to make it easier to quickly spin up the images for testing

```
docker_gcc7() {
echo "Using $PWD as Build folder"
if [[ "$1" == "" ]]; then
    echo "Argument 1 Needs to be the project folder"
    return 1
fi

docker run -it -v ${PWD}:/home/conan/build -v $(realpath ${1}):/home/conan/project:ro ubuntu1804gcc:Dockerfile /bin/bash
}
docker_gcc9() {
echo "Using $PWD as Build folder"
if [[ "$1" == "" ]]; then
    echo "Argument 1 Needs to be the project folder"
    return 1
fi

docker run -it -v ${PWD}:/home/conan/build -v $(realpath ${1}):/home/conan/project:ro ubuntu2004gcc:Dockerfile /bin/bash
}
```
