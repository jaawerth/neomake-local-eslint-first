" Settable options:
"   'g:nrun_disable_which' - disables "which" fallback
"   'g:nrun_which_cmd' - sets command for "which." default is simply "which",
"   available on all (?) UNIX shells.
if !exists('g:nrun_which_cmd')
	let g:nrun_which_cmd = 'which'
endif

if !exists('g:nrun_disable_which')
	let g:nrun_disable_which = 0
endif

" trim excess whitespace
function nrun#StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" check for locally-installed executable before falling back to 'which'
function nrun#Which(cmd)
	let l:cwd = getcwd()
	let l:rp = fnamemodify('/', ':p')
	let l:hp = fnamemodify('~/', ':p')
	while l:cwd != l:hp && l:cwd != l:rp
		if filereadable(resolve(l:cwd . '/package.json'))
			let l:execPath = fnamemodify(l:cwd . '/node_modules/.bin/' . a:cmd, ':p')
			if executable(l:execPath)
				return l:execPath
			else
				break
			endif
		endif
		let l:cwd = resolve(l:cwd . '/..')
	endwhile
	if !g:nrun_disable_which
		let l:execPath = nrun#StrTrim(system(g:nrun_which_cmd . ' ' . a:cmd))
		if executable(l:execPath)
			return l:execPath
		else
			return a:cmd . ' not found'
		endif
	else
		return a:cmd . ' not found'
	endif
endfunction

function nrun#Exec(cmd)
	let l:exec = nrun#Which(a:cmd)
	if match(l:exec, 'not found$') != -1
		throw l:exec
	else
		return system(l:exec)
	endif
endfunction
