# MySQLDump for off site computers
To be run on servers which allows mysqldump remotely. 

## Security (using SSL)
- Set up SSL on Windows Server where MySQL is hosted
    - [Instructions Here](https://serverfault.com/questions/783861/enabling-ssl-in-mysql-when-using-windows-as-a-server-and-client)
- Add certificate path `ssl-path` to my.cnf file 