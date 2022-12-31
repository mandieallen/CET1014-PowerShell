###################################################################
#
# .Description
# Add new Server to a domain
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

start-transcript c:\Logs\svr1-part2.txt

$hostname = hostname

$domainName = Read-Host "Enter the fully qualified domain name of the domain you created"

Add-Computer -ComputerName $hostname -LocalCredential $hostname\Administrator -DomainName $domainName -Credential $domainName\Administrator 

Stop-Transcript

Restart-Computer
