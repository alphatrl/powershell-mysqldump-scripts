# Script `mysqldump` on PowerShell
Automation of `mysqldump` using PowerShell

# Key Features
- Minimal installation required
- Encrypt and decrypt SQL backups using the scripts provided
- Cross Platform
    - Windows
    - macOS
    - Linux

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
    * macOS: In Progress
    * Linux: In Progress

## Contents in repository
### mysqldump-backup.ps1
Script for backing up MySQL database. SQL files are not encrypted at all

### mysqldump-secure
Encrypting and Decrypting your MySQL database. Do not loose your public and private keys.
#### mysqldump-decrypt-backup.ps1
Script to decrypt encrypted MySQL backups
#### mysqldump-encrypt-backup.ps1
Script to backup and encrypt MySQL database

### others
Non-PowerShell files
#### my.cnf
File that contains credentials to log into MySQL database.
Ensure that it is read and executable only.
