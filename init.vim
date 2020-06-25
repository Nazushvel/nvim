if has('win64')
    if empty(glob('~\vimfiles\autoload\plug.vim'))
    md ~\vimfiles\autoload
    $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    (New-Object Net.WebClient).DownloadFile(
	$uri,
	$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
	    "~\vimfiles\autoload\plug.vim"
  )
)
    endif
endif

if has('unix')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
    endif
endif

if has('unix')
    call plug#begin('~/.local/share/nvim/plugged')
endif
if has('win64')
    call plug#begin()
endif
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
if has('unix')
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
endif
Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if has('win64')
    Plug 'PProvost/vim-ps1'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'powershell -executionpolicy bypass -File install.ps1', }
endif
call plug#end()
set background=dark
colorscheme gruvbox
set cursorline
set noshowmode
set number
set shiftwidth=4
set softtabstop=4
let mapleader = ","
map <leader>n :set invnumber<CR>
let g:deoplete#enable_at_startup = 1
set hidden
if has('unix')
    let g:LanguageClient_serverCommands = {
	\ 'python': ['/usr/bin/pyls'],
	\ }
endif
if has('win64')
    set backupdir=~\backups
    set directory=~\backups
    let g:LanguageClient_serverCommands = {
    \ 'ps1': ['powershell', '-NoProfile', '-NoLogo', '-NonInteractive', '~/Documents/WindowsPowerShell/Modules/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1', '-HostName', 'nvim', '-HostProfileId', '0', '-HostVersion', '1.0.0', '-LogPath', '~/pses.log', '-LogLevel', 'Diagnostic', '-BundledModulesPath', '~/Documents/WindowsPowerShell/Modules/PowerShellEditorServices', '-Stdio', '-SessionDetailsPath', '~/.pses.json']
    \ }
endif
