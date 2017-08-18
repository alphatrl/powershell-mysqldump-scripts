# Navigate to the backups folder
$path = "/backups"
Set-Location $path

# get today's date to name today backup folder
$date = Get-Date -UFormat "%Y-%m-%d"

# Check for log file
# Create if not found
$logFile = "automate-mysqldump.log"
if (-NOT (Test-Path $logFile)) {
    New-Item -Path $logFile
    Add-Content $logFile "Created on: $date`n"
}

# create today's backup directory if it does not exist
if (-NOT (Test-Path $date)){
    New-Item -ItemType Directory $date
    Add-Content $logFile "[$date]: New $date directory is created"
}
# Set-Location $date
Add-Content $logFile "[$date]: Entering $((Get-Location).path)"

# prepare encryption keys to encrypt backup files
# get path of public key
# do not proceed if public key is not found
$pubKeyPath = "PUBLIC/KEY/PATH/mysqldump-secure.pub.pem"
if (-NOT (Test-Path $pubKeyPath)) {
    Add-Content $logFile "[$date]: Public Key not found. Exiting program`n"
    EXIT # stop program from runnning
}
Add-Content $logFile "[$date]: Public Key exist. Proceeding with backup"

# invoke mysqldump and output to an encrypted file
mysqldump --defaults-file=my.cnf --single-transaction -u root --all-databases  | openssl smime -encrypt -binary -text -aes256 -out $date/database-backup.sql.enc -outform DER $pubKeyPath
Add-Content $logFile "[$date]: databases (encrypted) has been backed up"

Add-Content $logFile ""
# pause