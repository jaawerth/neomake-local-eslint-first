" check for locally-installed executable before falling back to 'which'
function Nwhich(cmd)
	let l:cwd = getcwd()
	let l:rp = fnamemodify('/', ':p')
	let l:hp = fnamemodify('~/', ':p')
	while l:cwd != l:hp && l:cwd != l:rp
		if filereadable(resolve(l:cwd . '/package.json'))
			if filereadable(fnamemodify(l:cwd . '/node_modules/.bin/' . a:cmd, ':p'))
				return fnamemodify(l:cwd . '/node_modules/.bin/' . a:cmd, ':p')
			endif
			echo "failinner"
		endif
		let l:cwd = resolve(l:cwd . '/..')
	endwhile
	return system('which ' . a:cmd)
endfunction

" neomake configuration
let g:neomake_javascript_eslint_exe = Nwhich('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
autocmd! BufWinEnter * Neomake
