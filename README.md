MyMeanJs
========
A scalable, modularizable and reutilizable architecture for node.js and angular.js app (MEAN Stack).

![Alternativer Text](/docs/images/mymean.png)

Technologies
===========
    - Node.js 
    - Express framework
    - Angular.js
    - Bootstrap
    - Mongo DB

Features
========
## Backend
    - Node.js with Express Framework
    - REST api
    - i18n api
    - Mongo DB, using Mongoose
    - Api Authentication using Bearer token, powered by Json Web Token (JWT)
    - Jade as template engine
    - Coffee Script
    - Grunt
    - npm
    - Bower

# Frontend
    - Angular.js
    - Bootstrap (Responsive)
    - Remember me (based on session storage)
    - Architecture based in reusable modules
    - Register user
    - Login for register users
    - User roles 

# Prerequisites to install
    
    sudo npm -g install coffee-script
    sudo npm -g install nodemon
    sudo npm -g install express
    sudo npm -g install grunt-cli

# Installation & start

    # clone repo
    git clone https://github.com/cbaeza/mymeanjs.git 
    # change to project
    cd mymeanjs
    # install node packages
    npm install
    # install bower packages
    bower install
    # restore db
    mongorestore -db db/dump/mymean
    # compile client  
    grunt build-client
    # start server
    npm start
    # call site
    http://localhost:3030

## Utils
    
    {
    "email":"carlos.baeza@posteo.de",
    "password":"c79c6f489015e0bc97f892e357db7156"
    }
