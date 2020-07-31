set laststatus=2            " set the bottom status baret statusline +=%mod

function! InsertStatuslineColor(mode)
    hi startEndColor ctermfg=white ctermbg=40    
    hi 1stSepColor ctermfg=40 ctermbg=166 
endfunction

function! LeaveColor()
    hi startEndColor ctermfg=white ctermbg=21    "Blue
    hi 1stSepColor ctermfg=21 ctermbg=166 
endfunction

function! ModifiedColor()
    if &mod == 1
        hi statusline guibg=DarkGrey ctermfg=1 guifg=White ctermbg=15
        hi 3rdSepColor ctermfg=239 ctermbg=1
        hi 4thSepColor ctermfg=166 ctermbg=1

        hi EndColor ctermfg=white ctermbg=1
        hi 5thSepColor ctermfg=1 ctermbg=166
    else
        hi statusline guibg=DarkGrey ctermfg=0 guifg=White ctermbg=15
        hi 3rdSepColor ctermfg=239 ctermbg=0
        hi 4thSepColor ctermfg=166 ctermbg=0

        hi EndColor ctermfg=white ctermbg=21    
        hi 5thSepColor ctermfg=21 ctermbg=166
    endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call LeaveColor()
au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()

hi statusline guibg=DarkGrey ctermfg=0 guifg=White ctermbg=15
hi startEndColor ctermfg=white ctermbg=21       "Blue
hi 1stSepColor ctermfg=21 ctermbg=166 
    hi 2ndColor ctermfg=black ctermbg=166       "Orenge
    hi 2ndSepColor ctermfg=166 ctermbg=239

    hi 3rdColor ctermfg=white ctermbg=239       "Black
    hi 3rdSepColor ctermfg=239 ctermbg=0

    hi 4thColor ctermfg=black ctermbg=190       "Yellow
    hi 4thSepColor ctermfg=166 ctermbg=0
hi EndColor ctermfg=white ctermbg=21            "Blue
hi 5thSepColor ctermfg=21 ctermbg=166


set statusline=
set statusline +=%#startEndColor#       " Use my custom color for content after this
set statusline +=\ \ %{toupper(g:currentmode[mode()])}           " The current mode
set statusline +=\ %#1stSepColor#      " A space

set statusline +=%#2ndColor#     
set statusline +=\ %n                   "buffer number
set statusline +=\ %#2ndSepColor#      " A space

set statusline +=%#3rdColor#            " Use MyCustomColor for content after this
set statusline +=\                      " A space
set statusline +=%.40F                  " Full file path, at most 40 characters
set statusline +=\ %#3rdSepColor#      " A space
set statusline +=%*                     " Restore default highlight

set statusline +=%=                     " Split the left and right sides
set statusline +=\ %#4thSepColor#      " A space
set statusline +=%#2ndColor#            " Use MyCustomColor for content after this
set statusline +=\                      " A space
set statusline +=%l/%L                  " Line number / total line
set statusline +=\                      " A space
set statusline +=%3c\ %04B              " Column number / character under cursor
set statusline +=\                      " A space
set statusline +=\ %#5thSepColor#      " A space
set statusline +=%#EndColor#            " Use MyCustomColor for content after this
set statusline +=\ %m\                  "Readonly? Modified?.


let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}


