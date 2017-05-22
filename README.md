# Find KeePass databases
HarmJ0y wrote a detailed blog on attacking Keepass [A Case Study in Attacking KeePass](http://www.harmj0y.net/blog/redteaming/a-case-study-in-attacking-keepass/)
It's well worth the time to read if you use Keepass or are doing security audits.

In the blog he had a one line Powershell script that would search for keepass executables and databaess starting at c:\users\ recusively.   

I added code to search all drives on the computer including USB and network mapped drives.
After it builds the list of files, it copies them to the directory that the script was executed from.
If you run the script from a USB flash drive, wait for it to finish, eject the drive and try to crack the hashes offline.

I want to port the code the [Hak5 BashBunny](https://hakshop.com/products/bash-bunny) for automated collection.
