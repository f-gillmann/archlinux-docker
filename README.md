# archlinux-docker
Arch Linux docker image but preconfigured with non root user

## Usage
Building the image
```bash
docker build -t archdocker .
```

Running the image
```bash
docker run --interactive --tty --rm --name archlinux archdocker
```
