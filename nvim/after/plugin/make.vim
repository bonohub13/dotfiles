autocmd BufEnter,WinEnter term:///usr/bin/make :startinsert!
autocmd BufLeave term:///usr/bin/make :stopinsert!
