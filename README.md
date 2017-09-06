# Script `mysqldump` on PowerShell
Scripts to use `mysqldump` on Windows OS

# Key Features
- PowerShell Scripts to run your mysqldump on Windows

# Getting Started
These instructions will help get you started with the installation of these scripts

## Prerequisite
- [PowerShell]()
- [OpenSSL]() (if encrypting and decrypting)
- MySQL

## Installation
1. Copy scripts to host machine
2. Change file paths in the file according
    - `$path // path where backups are stored`
    - `$logFile // path of the log file`
    - `$pubKeyPath // path of the public key`
    - `$privKeyPath // path of the private key`
3. Automate backups
    * Windows: Use Task Scheduler to run the scripts automatically.

## Contents in repository
### mysqldump-basic
For remote backups or backups on your database server machine

### mysqldump-pki
Encrypt and decrypt you sql file dumps on your server machine and client machine (FTP not included)
#### mysqldump-decrypt-backup.ps1
Script to decrypt encrypted MySQL backups
#### mysqldump-encrypt-backup.ps1
Script to backup and encrypt MySQL backups

### others
Non-PowerShell files
#### my.cnf
File that contains credentials to log into MySQL database.
