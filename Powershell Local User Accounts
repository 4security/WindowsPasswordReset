Get-WmiObject win32_useraccount | Foreach-Object {
([adsi](“WinNT://”+$_.caption).replace(“\”,”/”)).SetPassword(“FluxCapacitor!11-5-1955”)
}
