# MySQLDump
- To be run on your own personal computers or be run on the machine hosting the database (no security)

## Do remote backups
- Ensure that there is a user account which allows remote connections to the database server
- Add server address: `host=192.168.10.2`

### Security (using SSL) for remote backups
- Set up SSL on Windows Server where MySQL is hosted
    - [Instructions Here](https://serverfault.com/questions/783861/enabling-ssl-in-mysql-when-using-windows-as-a-server-and-client)
- Add certificate path `ssl-path` to my.cnf file 