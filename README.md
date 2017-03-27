# Introduction #
this project tests user flows in Juke web and mobile application
framework: Ruby, Selenium webdriver, Cucumber and Rspec expectations.

## how to run ##
```
bundle install
bundle exec cucumber
```
for running the test (will run buy movie and search product)
the Scenarios for mobile application are in android_app.featurex file

## open issues ##
Chrome driver as an issue with maximize browser (and as a result problems with locating elements)
I used one method Javascript execute_script command to solve that issue.
As well as in my machine I needed to restart and Chrome got back to normal
