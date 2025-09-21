" ================================================
" == https://github.com/romainl/idiomatic-vimrc ==
" ================================================

" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
" set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Intuitive backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right
                               " of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to move 
                               " around and `<CR>` to validate.

" ============
" == Gemini ==
" ============

" Mengatur lebar karakter tab menjadi 4 spasi
set tabstop=4

" Mengatur jumlah spasi yang digunakan untuk indentasi otomatis menjadi 4
set shiftwidth=4

" Mengubah tab menjadi spasi saat menekan tombol Tab
set expandtab

" Mengatur softtabstop agar tombol Tab dan Backspace bekerja dengan baik dengan expandtab
set softtabstop=4

set number relativenumber

set hlsearch     " Sorot semua hasil pencarian yang cocok

set mouse=a      " Mengaktifkan mouse di semua mode (normal, visual, insert, command-line)

" set laststatus=2 " Selalu tampilkan status bar

" set wrap       " Mengaktifkan word wrap 
set nowrap       " Mengaktifkan word wrap

" Buat direktori ini terlebih dahulu! mkdir -p ~/.vim/backup
" Buat direktori ini terlebih dahulu! mkdir -p ~/.vim/undodir
set backup                  " Buat file backup saat menulis ulang file
set backupdir=~/.vim/backup " Tempatkan file backup di sini
set undofile                " Aktifkan undo persisten (bisa undo perubahan setelah menutup dan membuka Vim)
set undodir=~/.vim/undodir  " Tempatkan file undo di sini

set list                    " Menampilkan karakter tak terlihat
set listchars=tab:▸\ ,nbsp:+,extends:>,precedes:< " ,space:·,trail:-
" tab:▸\     -> tab akan terlihat sebagai panah kanan dan spasi
" trail:-    -> spasi di akhir baris terlihat sebagai tanda hubung
" nbsp:+     -> non-breaking space sebagai plus
" extends:>  -> tanda panah jika baris terpotong ke kanan
" precedes:< -> tanda panah jika baris terpotong ke kiri
" space:·    -> spasi biasa terlihat sebagai titik tengah 

" Autocmd untuk file Python
" autocmd FileType py setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
autocmd filetype makefile setlocal noexpandtab

" =========
" == git ==
" =========

" Setting some decent VIM settings for programming
" This source file comes from git-for-windows build-extra repository (git-extra/vimrc)

ru! defaults.vim                " Use Enhanced Vim defaults
" set mouse=                      " Reset the mouse setting from defaults
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set wildmode=list:longest,longest:full   " Better command line completion

" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  set termguicolors             " Uncomment to allow truecolors on mintty
endif
