Mizzen
======
[![Build Status](https://travis-ci.org/kvchen/mizzen.svg)](https://travis-ci.org/kvchen/mizzen)

## Introduction

Mizzen is a framework that allows for arbitrary server-side code execution. It is designed for computer science instructors and educators to set up simple autograding services that allow for course, problem set, and submission management.

Being Docker-based, Mizzen also comes with security in the form of virtualization. All autograding scripts are run in containers, which makes them slightly safer than running them in the same namespace as instructor accounts (as is often the case).

## Installation

Mizzen relies on [Docker](https://www.docker.com/), [MongoDB](http://www.mongodb.org/), [Node.js](https://nodejs.org/), and [Redis](http://redis.io/). These dependencies should be installed prior to using Mizzen.

```
$ npm install mizzen
```

To install dependencies for Node and client-side libraries from Bower:

```
npm install
bower install
```

To run tests:

```
npm test
```


## Documentation

TODO

