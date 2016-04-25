" check for locally-installed executable before falling back to 'which'

" neomake configuration
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
autocmd! BufWinEnter * Neomake
