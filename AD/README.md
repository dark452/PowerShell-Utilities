# AD utilities 
## Usage
### GetMembersFromSG.ps1
This script retrieve all members that belong to a security group, to a CSV file and send an email with the attached file.
Before executing the script, you must change the **$FILEPATH** variable in which the CSV file will stored.

You need to specify the security group name and the emails(splited by commas) that will receive the CSV file with list of users.

```
.\GetMembersFromSG.ps1  "SGNAME" "test1@gmail.com,test2@hotmail.com,test3@yahoo.es"
```
