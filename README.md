Simple Single Page Application
============

Built with Bower, Browserify, Backbone, Foundation, Nunjucks, ...

This App uses my simple PHP based [REST-API](https://github.com/PatrickTaddey/php-rest-api/ "REST-API"). 

Installation
--------------
#### clone repository

```sh
git clone https://github.com/PatrickTaddey/single-page-application.git
```

#### Setup client

```sh
cd single-page-application/
npm install
bower install

# start development in app/dev/* Folders
# output is in app/build/*
grunt build

# start deployment
# output is in app/release/* Folders
grunt release
```