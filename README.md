# vue-frontend

## Project setup
The full project is dockerized. To setup project, create an docker image:
```
> docker build -t <image name>:latest -f Dockerfile.dev .
> docker build -t mda1234/vue-dev:latest -f Dockerfile.dev .
```
image name needs to be pasted into docker-compose file at images tag.

### Compiles and hot-reloads for development
**ATTENTION:** `docker-compose` requires an existing image. To build this image, see "Project setup"
```
> docker-compose up
```

### Compiles and minifies for production
```
> docker build -t <image name>:latest .
> docker build -t mda1234/vue-prod:latest .
```

### Run your tests
tests are integrated in docker-compose.
To single execute them, run
```
> docker run -v `pwd`:/app <image name>:latest npm run test
> docker run -v `pwd`:/app mda1234/vue-dev:latest npm run test
```
You can execute tests locally to, by running:
```
> npm run test
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
