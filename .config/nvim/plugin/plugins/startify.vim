" List of sections in the start menu
let g:startify_lists = [
    \ { 'type': 'commands',  'header': ['    Commands']       },
    \ ]

" List of commands
let g:startify_commands = [
    \ {'u': ['Update plugins', ':PlugUpdate']},
    \ {'h': ['Check health',':checkhealth']},
    \ {'c': ['Clean plugins', ':PlugClean']},
    \ ]

" Number of spaces for left padding
let g:startify_padding_left = 4

let g:startify_custom_header = [strftime('    %c')]

