## 1. Ruby version: 2.3.1
Install ruby with above version

--------------------------
## 2. Database Application
###### Postgres

--------------------------
## 3. Configure application
Configure `Environment variable` for SMTP setting
sudo nano ~/.bashrc
Add below details
export SENDMAIL_PASSWORD=Your gmail account password
export SENDMAIL_USERNAME=Your gmail account email  
export MAIL_HOST=localhost:3000

## 4. Services (Error Email Notifications)
Configure in `./config/application.rb`
Configure in `./app/mailers/application_mailer.rb`
