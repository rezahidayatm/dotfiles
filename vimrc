" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
" syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set autoindent                   " Minimal automatic indenting for any filetype.
" set backspace=indent,eol,start " Intuitive backspace behavior.
set hidden                       " Possibility to have more than one unsaved buffers.
" set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                        " Shows the current line number at the bottom-right
                                 " of the screen.
set wildmenu                     " Great command-line completion, use `<Tab>` to move 
                                 " around and `<CR>` to validate.

" set viminfo='0,:0,<0,@0,f0,no/

" set ai

" Mengaktifkan penyorotan sintaks (jika belum ada)
" syntax on

" Mengaktifkan deteksi jenis file, plugin, dan indentasi otomatis (sangat direkomendasikan)
" filetype plugin indent on

" Mengatur lebar karakter tab menjadi 4 spasi
set tabstop=4

" Mengatur jumlah spasi yang digunakan untuk indentasi otomatis menjadi 4
set shiftwidth=4

" Mengubah tab menjadi spasi saat menekan tombol Tab (sangat direkomendasikan untuk konsistensi)
set expandtab

" Opsi tambahan yang sering digunakan untuk C# dan bahasa lain
" Mengatur softtabstop agar tombol Tab dan Backspace bekerja dengan baik dengan expandtab
set softtabstop=4

set number relativenumber
" set numberwidth=5

" set incsearch " Sorot hasil pencarian saat Anda mengetik
" set hlsearch  " Sorot semua hasil pencarian yang cocok

set mouse=a " Mengaktifkan mouse di semua mode (normal, visual, insert, command-line)

set laststatus=2 " Selalu tampilkan status bar

" set wrap " Mengaktifkan word wrap (baris panjang akan dilipat)
" set nowrap " Jika Anda tidak ingin word wrap (baris panjang akan terus ke kanan)

" Buat direktori ini terlebih dahulu! mkdir -p ~/.vim/backup
" Buat direktori ini terlebih dahulu! mkdir -p ~/.vim/undodir
set backup              " Buat file backup saat menulis ulang file
set backupdir=~/.vim/backup " Tempatkan file backup di sini
set undofile            " Aktifkan undo persisten (bisa undo perubahan setelah menutup dan membuka Vim)
set undodir=~/.vim/undodir " Tempatkan file undo di sini

" set autoindent

set list                " Menampilkan karakter tak terlihat
set listchars=tab:▸\ ,nbsp:+,extends:>,precedes:< " ,space:·,trail:-
" tab:▸\  -> tab akan terlihat sebagai panah kanan dan spasi
" trail:- -> spasi di akhir baris terlihat sebagai tanda hubung
" nbsp:+   -> non-breaking space sebagai plus
" extends:> -> tanda panah jika baris terpotong ke kanan
" precedes:< -> tanda panah jika baris terpotong ke kiri
" space:· -> spasi biasa terlihat sebagai titik tengah (opsional, bisa mengganggu)

" Autocmd untuk file C#
" autocmd FileType cs setlocal tabstop=3 shiftwidth=3 expandtab softtabstop=3
autocmd filetype makefile setlocal noexpandtab

" ==================================================
" DEFAULT SETTING
" ==================================================

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  " 1724126 - do not open new file with .spec suffix with spec file template
  " apparently there are other file types with .spec suffix, so disable the
  " template
  " autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" Don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

" Source a global configuration file if available
if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif
