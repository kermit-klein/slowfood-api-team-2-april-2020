
# InstaFood API

[![Build Status](https://semaphoreci.com/api/v1/kermit-klein/slowfood-api-team-2-april-2020/branches/dependabot-bundler-rack-2-2-3/badge.svg)](https://semaphoreci.com/kermit-klein/slowfood-api-team-2-april-2020)

### Authors

[Ali Erbay](https://github.com/kermit-klein)  
[Marcus Sjöqvist](https://github.com/viamarcus)  

## Built with
**Front End:** React v.16.12.0 | CSS  
**Back End:** Ruby 2.5.1 | Rails 6.0.2 
**Testing framework:** Rspec 
**Deployed at:** [Netlify](https://stoic-wilson-58c3b4.netlify.app/) and [Heroku](https://www.heroku.com).
## The code   
This project is the backend API for our InstaFood application. The master repository for the InstaFood client side, built with React, can be found [here](https://github.com/kermit-klein/slowfood-client-team-2-april-2020)

### Dependencies  
* Ruby
* Rails
* Rspec
* Puma
* Devise
* Pry
* Shouda-Matchers
* Coveralls
* Factory Bot
* Bootsnap
* Active Model Serializers

### Setup   
To test this application, fork the repo to your own GitHub account and clone it to your local workspace. </br>
*Note:*Be sure to set up the front end (noted above), in order to fully interact with the application. 
To install all of the dependencies:  
```
$ bundle install 
```
To create a new database with sample data:  
```
$ rails db:create db:migrate db:seed 
```
To run the unit tests:  

```
$ rspec
``` 
  
To start the application and run it on your local host:
```
$ rails s
```

## License  
[MIT-license](https://en.wikipedia.org/wiki/MIT_License)
