#Credit - https://www.petri.com/how-to-change-user-password-with-powershell

Get-WmiObject win32_useraccount | Foreach-Object {
([adsi](“WinNT://”+$_.caption).replace(“\”,”/”)).SetPassword(“FluxCapacitor!11-5-1955”)
}
