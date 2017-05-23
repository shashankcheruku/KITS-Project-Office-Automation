# KITS-Project-Office-Automation

## RAW Files and Screenshots

Click [here](https://github.com/shashankcheruku/KITS-Project-Office-Automation/tree/master/KITSW%20Project%20Office/web) to view the files without downloading and executing them. The screenshots of the execution have been provided [here](https://github.com/shashankcheruku/KITS-Project-Office-Automation/tree/master/Screenshots)

## Download Link
Click on this [link](https://drive.google.com/file/d/0B4qIdu7m7sgYN2oxMzhQclhOMDg/view?usp=sharing) to download the file zip file, which again has two files - zip file named KITS Project Office and kitsw_po.dmp file.

## Video Demo

Click on the thumbnail below to view the video demonstrating the sample execution of the project.
[![IMAGE ALT TEXT HERE](https://github.com/shashankcheruku/KITS-Project-Office-Automation/blob/master/Screenshots/0_Video%20Screenshot.jpg)](https://youtu.be/wIk0pgwrnn0)

## Environment Setup

From the downloaded zip file, you get two files:
- KITS Project Office.zip - Open Netbeans >> Import Project >> From Zip >> Select this file
- kitsw_po.dmp:
  -  Initially, while installing ORACLE SQL*PLUS, enter the password as "shashank" without quotes, since this password is used throughout the project to connect to the database.
  -  Open command prompt and enter this command - imp SYSTEM/shashank file=<file_location\kitsw_po.dmp> full=y;
  -  This imports all the tables (listed below) that are used in this project along with some sample data.
- Open Netbeans and run the project, the project opens in the defualt browser.

## List of Tables

- Login
- Maintenance Entry
- Budget
- Quote Invitations
- Quotes
- Purchases List
- Shop Database
- Store
- Stock Issue
- Message Box
- Complaints
- Complaint Report
- Feedback
