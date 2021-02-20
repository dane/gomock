# gomock containerized

An easy and repeatable way to create gomock's mockgen in a container.

## Usage

```
docker run ghcr.io/dane/gomock:v1.5.0 [ARGS]
```

## Build

```
make
```

## Commands

- `make tag` fetches the latest tag from github.com/golang/gomock
- `make build` uses the latest tag and builds an OCI image
- `make release` pushes the image to GHCR
- `make` runs `tag`, `build`, and `release` in order
