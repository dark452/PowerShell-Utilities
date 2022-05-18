$SG=$Args[0]
    #Common Variables
$FILEPATH = "C:\Users\DaRk452\powershell"
$DATE = Get-Date -Format "dd.MM.yyyyT.HH.mm.ss"
$FILENAME = "$SG.$DATE.csv"
$fromaddress = "your-email@email.com"
$toaddress = $Args[1]
$Subject = "Report X SG members"
$body = "Dear team, please find attached the CSV file with the $SG users"
$attachment = "$FILEPATH\$FILENAME"
$smtpserver = "smtp server"

Write-Output "Building the CSV file for SG:$SG..."
Get-ADGroupMember -Identity $SG -Recursive | Get-ADUser -Property DisplayName | Select-Object DisplayName | Export-Csv "$FILEPATH\$FILENAME" -NoTypeInformation

##################################
Write-Output "Sending email..."
$message = new-object System.Net.Mail.MailMessage
$message.From = $fromaddress
$message.To.Add($toaddress)
$message.IsBodyHtml = $True
$message.Subject = $Subject
$attach = new-object Net.Mail.Attachment($attachment)
$message.Attachments.Add($attach)
$message.body = $body
$smtp = new-object Net.Mail.SmtpClient($smtpserver)
$smtp.Send($message)
Write-Output "Task completed!"
