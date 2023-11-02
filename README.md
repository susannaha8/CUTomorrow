# _CUTomorrow_
* Elizabeth Commisso (edc2147)
* Chloe Nguyen (cn2489) 
* Susannah Abrams (sma2243)
* Claudia Lihar (cl4178)

* **TAs** Yuhan Xia: @Erisae, Raphael Sofaer: @rsofaer

## Instructions to Run & Test

### On Heroku:
Follow the deployment link:


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
To run our Cucumber tests:
```
  bundle exec cucumber
```
## Further Notes
We use a MySQL database for our courses in this application, which we will deploy in our second project iteration. 
Please contact us if you have any questions or concerns.
