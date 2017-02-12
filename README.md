# mm.vim
Vim plugin for using with mm

## Installation
I recommend using vundle or some other vim plugin manager. Otherwise drop the mm.vim file in your plugins folder

## Usage
First set `let g:mm_accounts = [  ]` to a list of your connection names in your .vimrc. This plugin is not so useful without that.

This plugin activates whenever you open a file called `mucking_around`

When the plugin loads it does the following;

* adjusts many common vim settings to make the window more input bar/history like
* maps `<Leader>m` in both normal _and input mode_ to send the current line to your active account
* maps `<Leader>v` in visual mode to send selected text to your active account
* maps a `<Leader>#` for each connection in `g:mm_accounts`, so the first connection is `<Leader>1`, the next `<Leader>2`, ect

Now you select your connection, use `<Leader>#` to select chat and `<Leader>m` to send the current line

## Settings
`g:mm_accounts = ['connection1', 'connection2', 'awesomechar']` *Mandatory*

You need to set this List to names of all of your connections you use in mm
The names of the accounts should match the names of you connections exactly, case matters.

`g:mm_nohistorymode = 1` *optional*

Setting this sets no history mode, which wipes the vum buffer each time you send to the muck.
Normally you will want to keep history since this will allow for things like command and name completion using history

## Tips
* I keep all the login strings at the top of my `mmfile` file, one per line to speed up login.
* On the next line after that I keep all the most common commands and names I type so I can use ^n and ^p history completion
