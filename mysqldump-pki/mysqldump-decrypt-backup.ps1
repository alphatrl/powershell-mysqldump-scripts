# Declare variables
$path = "/backups"                                          # path of backup folder
$logFile = "automate-mysqldump.log"                         # path of log file
$privKeyPath = "PRIVATE/KEY/PATH/mysqldump-secure.priv.pem" # path of private key to decrypt files

# Navigate to the backups folder
Set-Location $path

# get today's date to name today backup folder
$date = Get-Date -UFormat "%Y-%m-%d"

# Check for log file
# Create if not found
if (-NOT (Test-Path $logFile)) {
    New-Item -Path $logFile
    Add-Content $logFile "Created on: $date`n"
}

# if today backup do not exist, exit program
if (-NOT (Test-Path $date)){
    Add-Content $logFile "[$date]: $date directory is not found. Exiting`n"
    EXIT # stop program from running
}
# Set-Location $date
Add-Content $logFile "[$date]: Entering $((Get-Location).path)"

# prepare decryption key to decrypt backup files
# do not proceed if private key is not found
if (-NOT (Test-Path $privKeyPath)) {
    Add-Content $logFile "[$date]: Private Key not found. Exiting program`n"
    EXIT # stop program from runnning
}
Add-Content $logFile "[$date]: Private Key exist. Proceeding with decryption"

# get all `.enc` files in directory
$encryptedSQLFiles = Get-ChildItem -Path $($date + "/*") -Include *.enc
#  iterate through files and decrypt
foreach ($file in $encryptedSQLFiles){
    Add-Content $logFile "[$date]: Decrypting $file"
    $newFileName = $date + "/" + $file.BaseName
    openssl smime -decrypt -in $file -binary -inform DEM -inkey $privKeyPath -out $newFileName
    Add-Content $logFile "[$date]: $($file.BaseName) has been decrypted"
}

Add-Content $logFile ""
# pause