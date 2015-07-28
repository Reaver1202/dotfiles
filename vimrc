set nocompatible                " get rid of Vi compatibility mode
"## Pathagon als Vim-Plugin-Mgr. nutzen
execute pathogen#infect()
Helptags

"## Folding
"This actually loads the file "indent.vim" in 'runtimepath'.
"The result is that when a file is edited its indent file is loaded (if there
"is one for the detected filetype). |indent-expression|
"This actually loads the file "ftplugin.vim" in 'runtimepath'.
"The result is that when a file is edited its plugin file is loaded (if there
"is one for the detected filetype). |filetype-plugin|
filetype plugin indent on

"## Syntax Highlighting an
syntax on

"## Zeilennummern an
set number

"## Color Scheme:
set background=dark
set t_Co=256            " enable 256 Color Mode
" colorscheme [bclear | desert256 | tir_black | inkpot | ...]
colorscheme inkpot


set nohlsearch  " don't continue highlight searched phrases
set incsearch   " but do highlight while typing a search
set ignorecase  " make searches case-sensitive
set ruler       " always show info along bottom

"## Indent Guides
"set ts=2 sw=2 et
let g:indent_guides_guide_size = 4
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_start_level = 1


"## Automatische Einrückung: z.B. beim Programmieren
"set autoindent

set tabstop=8
set shiftwidth=8        " ## breite eines Indent (Einrückung)
set shiftround          " always indent/outdent to nearest tapstop
set expandtab           " ## Umwandlung von Tabs zu Spaces 
"## !!!! :retab --> um bisherige Tabs in Spaces wie hier konfiguriert
"umzuwandeln !!!!!! #################################################


"## :set paste --> damit 1:1 Inhalt gepastet wird 
"## an / aus --> im Insert-Mode
:set pastetoggle=<f5>

" tag bar with <F4>
nmap <F4> :TagbarToggle<CR>

" code formatting with <F3>
noremap <F3> :Autoformat<CR><CR>
let g:formatterpath = ['~/.vim/bundle/']

" Markdown
" Modify the list to add any other languages you use in your Markdown
" documents. You can use mappings like js=javascript to map between the
" language name in the code block (js) and the filetype name used by Vim
" (javascript).
let g:markdown_fenced_languages = ['ruby', 'java', 'py=python', 'bash=sh', 'tex', 'html', 'css', 'javascript', 'js=javascript', 'json=javascript', 'xml']
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"## see /ftplugin/markdown.vim
        "au BufNewFile,BufFilePre,BufRead *.md set tabstop=2
        "au BufNewFile,BufFilePre,BufRead *.md set shiftwidth=2

"## Pfad für vim-note Dateien
":let g:notes_directories = ['~/Dokumente/ImportantFiles/Bibliothek-Notes']

"## NERDtree bei jedem vim Start öffnen mit Ordner XY
"autocmd VimEnter * NERDTree ~/Dokumente/
"## das Editor Fenster aktiv machen (durch den Befehl vorher wäre 
"## der NERDtree aktv
"autocmd VimEnter * wincmd p

" start NERDTree automatically when vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree ~/Dokumente | endif
" NERDTree shortcut --> Current Folder
map <C-n> :NERDTreeTabsToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"###### MAPPINGS #######################################################

let mapleader=","


"## Pandoc Plugin"## Pandoc Plugin
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
"vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>

"Disable Arrow Keys: more Learning by doing :-)
no <down> <Nop>
no <up> <Nop>
no <right> <Nop>
no <left> <Nop>
"Insert Mode ist zum Bearbeiten, NICHT zum Bewegen!!! --> ESC + hjkl
"ino <down> <Nop>
"ino <up> <Nop>
"ino <right> <Nop>
"ino <left> <Nop>

vno <down> <Nop>
vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>

"## File-Tab Mappings

"no <down> ddp
"no <up> ddkP


"## quick pairs
imap <leader>` ``<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i


no <C-t> :tabnew <CR>
nmap <right> :tabnext <CR>
nmap <left> :tabprevious <CR>
"nmap  <C-w> :tabclose <CR>

nmap g<C-O> o<ESC>k
nmap gO O<ESC>j
" Kevins Konfig
 " style C in linux kernel normal form
" let g:formatprg_c = "astyle"
" let g:formatprg_args_c = "--style=linux --mode=c --indent=tab -xC80"
"
" spell checking
"au BufNewFile,BufRead,BufEnter   *.tex    setlocal spell   spelllang=de_20
"au BufNewFile,BufRead,BufEnter   README.* setlocal spell   spelllang=en_us


