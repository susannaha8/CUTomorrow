# _CUTomorrow_
* Elizabeth Commisso (edc2147)
* Chloe Nguyen (cn2489) 
* Susannah Abrams (sma2243)
* Claudia Lihar (cl4178)

* **TAs** Yuhan Xia: @Erisae, Raphael Sofaer: @rsofaer

## Instructions to Run & Test

### Through Heroku:
**Note**: We were having issues with the repository, so the Heroku link does not include the version that includes our Rspec tests, but they are located in the Github - please contact us if this causes any issues or if you have any questions. 

Follow the deployment link: https://cryptic-crag-96223-0df98d544074.herokuapp.com/schedule

### Through Github:
Note: We are using Ruby version 2.6.6 (you can install this with `rbenv install 2.6.6`)
```
  git clone https://github.com/susannaha8/CUTomorrow.git
```
```
  cd CUTomorrow
```

```
  bundle install
```
Now, to set up the databases:
```
  rake db:migrate
```
```
  rake db:seed
```
To run the application:
* And make sure you go to `localhost:3000` in your browser after starting the server
```
  rails server
```
If you are running it on codio, run:

```
  rails server -b 0.0.0.0
```
* Our database seed includes a test student. Feel free to login with email: sma2243@columbia.edu and password: test, or sign up with your own email. If you choose to sign up, once logged in, go to the profile page to add your major-- this will allow courses to appear by requirement on the "Add Courses" page. 

To run our Cucumber tests:
```
  bundle exec cucumber
```

