# glibc-builder
## A GNU C Library (glibc) builder
### Usage

1. Update the glibc version in the following file:
- set-glibc-version.sh

2. Build Docker container
```shell
./build-docker.sh
```

3. Run Docker container
```shell
./run-docker.sh
```

4. Copy glibc
```shell
./get-lib.sh
```

5. (Optional) Cleanup
```shell
./cleanup.sh
```
