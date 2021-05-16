## 1. Ruby version: 2.3.1
Install ruby with above version

--------------------------
## 2. Database Used
Postgres

--------------------------
## 3. Configure application
Configure `Environment variable` for SMTP setting
<br />
edit bashrc file
<br />
sudo nano ~/.bashrc
<br />
Add below details
export SENDMAIL_PASSWORD=Your gmail account password
<br />
export SENDMAIL_USERNAME=Your gmail account email id
<br />
export MAIL_HOST=localhost:3000
<br />