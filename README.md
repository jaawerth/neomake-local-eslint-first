# neomake-local-eslint-first
Set Neomake to use the local project's eslint when available for javascript files

## Install
Must already have neomake set up. This will automatically set eslint as a maker on top of setting its executable path for Neomake.
Using [vim-plug]((https://github.com/junegunn/vim-plug)):
```
Plug 'jaawerth/neomake-local-eslint-first'
```

## Nwhich('command')
This ftplugin will expose an "Nwhich" function, which will start with the current path, and traverse up a directory until it finds a `package.json` and `./node_modules/.bin/<command arg>`. It will fall back to `which` if it hits your root or home directory.


