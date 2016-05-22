# mm.vim
Vim plugin for using with mm

## Settings
`g.mm_accounts = ['connection1', 'connection2', 'awesomechar']` *Manditory*

You need to set this List to names of all of your connections you use in mm
The names of the accounts should match the names of you connections exactly, case matters.

`g.mm_nohistorymode = 1`

Setting this sets no history mode, which wipes the vum buffer each time you send to the muck.
Normally you will want to keep history since this will allow for things like command and name completion using history

## Tips
* I keep all the login strings at the top of my `mucking_around` file, one per line to speed up login.
* On the next line after that I keep all the most common commands and names I type so I can use ^n and ^p name completion

