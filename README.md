# Devop

> an convenient docker image configured for testing/developing/operates
>
> It‘s name was inspired by a fancy word *DevOps*.

have a try, or even use it as your base image. You do the math :)

## Usage

Build it on you own or pull and run a pre-built docker image.

```sh
git clone https://github.com/Thrimbda/devop.git
cd devop
docker build PREFIX/IMAGE_NAME:VERSION -f Dockerfile .

docker run -it --rm PREFIX/IMAGE_NAME:VERSION
```

or just...

```sh
docker run -it --rm thrimbda/devop:latest
```

## Feature

- USTC ppa source
- Thrimbda [adaptation of oh-my-zsh](https://github.com/Thrimbda/shell-set-up)
- Spf13 Vim configuration

### software installed

- curl
- make
- cmake
- htop
- zsh
- unzip
- git
- vim

## TODO

- [ ] configurable User
- [ ] convenient setup script