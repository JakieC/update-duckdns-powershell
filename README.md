# Update Duck DNS via PowerShell

Updates the IPv4 and IPv6 address of your Duck DNS domain(s)

## Usage

```
powershell.exe .\update_DuckDNS.ps1 -domain domain-name -token duck-dns-token
```
📑Error will log it at the script location

## Task Scheduler Instructions
1. Win+R (run): taskschd.msc
2. Right-click "Task Scheduler Library" and click "Crate Task..."
   1. Add the Name 
   2. Click "Change User or Group" and enter "NETWORK SERVICE" than click "OK"
   3. Click "Triggers" than click "New..."
      1. Select "Daily"
      2. Active "Repeat task every: 1 hour"
      3. Click "OK"
   4. Click "Actions" than click "New..."
      1. Program Script: powershell.exe
      2. Add Arguments: -ExecutionPolicy ByPass -File "**C:\Path\To\Powershell\Script\update_DuckDNS.ps1**" -domain **domain-name** -token **duck-dns-token**
   5. Click Setting and active "Run task as soon as possible after a scheduled start is missed"
   6. Click "OK" to save the task
3. Test
   1. Login to DuckDNS website and change IP randomly
   2. Right click the task in Task Scheduler and select "Run"
   3. Verify your IP has been updated on DuckDNS website.
   4. The "error.log" at the script loction

