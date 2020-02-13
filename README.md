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

##Secret Keys
To enable Travis CI to access my AWS-Account, it needs some secrets. To enable Travis, there are some steps to execute:
- in AWS select Sercices -> search for IAM
- in this service select "users"/"Benutzer"
- create a new user
    - give it a descriptive name (in my case "docker-vue-travis-ci")
    - select "Programmatic access" as Access type
    - next step select "attach existing policies directly"/"Vorhandene Richtlinien direkt hinzufügen" -> in it select permissions:
        - search for elastic beanstalk, select something with *full access*
    - "create user"
- ATTENTION: the keys will be shown only ONCE!!
  So be carefull when copying em!
  - use "Access key ID"/"Zugriffsschlüssel-ID" -> define them on Travis CI Page (see below)
  - use "Secret access key"/"Geheimer Zugriffsschlüssel" -> define them on Travis CI Page (see below)
- select project on TravisCI -> more options -> settings
-  Environment Variables -> stash the keys
    - "Display value in build log should NOT BE CHECKED"
    - key AWS_ACCESS_KEY, value XXX
    - key AWS_ACCESS_SECRET, value XXX
    - keys will be defined in `.travis.yml`
