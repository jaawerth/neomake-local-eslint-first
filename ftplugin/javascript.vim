" check for locally-installed executable before falling back to 'which'

" neomake configuration
let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
