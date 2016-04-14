
" neomake configuration
let g:neomake_javascript_eslint_exe = nlef#Nwhich('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
autocmd! BufWinEnter * Neomake
