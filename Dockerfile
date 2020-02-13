# this file intends to create a docker image, that is used for production!

# as defines, that everything below refers to builder phase
# this is, installing dependencies, and building the application
FROM node:alpine as builder
WORKDIR '/app'
RUN apk update && \
    apk upgrade && \
    apk add git
RUN git --version
RUN npm install -g @vue/cli
COPY package.json .
#RUN npm install
RUN npm install
# in here, we do not need any voume system anymore
COPY . .
RUN npm run build
# all the stuff, that we need can be found in /app/build



# by using a new FORM, we terminate the previous phase!
# each phase can only contain one <FROM>!
# Here we want to create the production container, that stores and provides the production code
FROM nginx
# --from flags copy stuff from build phase
# specify which folder to copty AND specify destination according to nginx specifications
# https://hub.docker.com/_/nginx/
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html

#CMD is not needed, because default of nginx container starts up itself
