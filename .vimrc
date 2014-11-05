"+----------------------------------------------------------------------------------------+
"  neobundle
"+----------------------------------------------------------------------------------------+
set nocompatible               " Be iMproved
filetype off                   " Required!
filetype plugin indent off     " Required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    "call neobundle#rc(expand('~/.vim/bundle/'))
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
" Perl�֘A�v���O�C�����o���h��
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
" �V���^�b�N�X�n�v���O�C�����o���h��
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
" �ҏW�����Ǘ�
NeoBundle "sjl/gundo.vim"

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

call neobundle#end()

filetype plugin indent on     " Required!

"+----------------------------------------------------------------------------------------+
"  ��{�ݒ�
"+----------------------------------------------------------------------------------------+
"�V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
set autoindent
"�t�@�C���ۑ��_�C�A���O�̏����f�B���N�g�����o�b�t�@�t�@�C���ʒu�ɐݒ�
set browsedir=buffer
"�N���b�v�{�[�h��OS�ƘA�g
set clipboard=unnamed
"Vi�݊����I�t
set nocompatible
"�^�u�̑���ɋ󔒕�����}������
set expandtab
"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden
"�C���N�������^���T�[�`���s��
set incsearch
"�^�u�����A�s���ȂǕs��������\������
set list
"list�ŕ\������镶���̃t�H�[�}�b�g���w�肷��
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=tab:>\ ,extends:<
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
match ZenkakuSpace /�@/ " �S�p����
"�s�ԍ���\������
set number
"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�_�ŕ\�����Ȃ�
set noshowmatch
"�������ɑ啶�����܂�ł������/�������
set smartcase
"�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent
"�s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
set smarttab
"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]
"�������t�@�C���̐擪�փ��[�v���Ȃ�
set nowrapscan
"�N�����̃��b�Z�[�W������
set shortmess+=I
"�O���̃G�f�B�^�ŕҏW���̃t�@�C�����ύX���ꂽ�玩���I�ɓǂݒ���
set autoread
"�������ʂ��n�C���C�g���Ȃ�
set nohlsearch
"Diff�ݒ� ���ߗ��čs��\���A��ɐ�������
set diffopt=filler,vertical
"�R�}���h�̗���ۑ������w��
set history=10000
"�^�u����ݒ�
set tabstop=2
set softtabstop=2
set shiftwidth=2
"�r�[�v����}��
set vb t_vb=

"�o�b�N�A�b�v
"set backup
set nobackup
"set backupdir=>/home/shimura/tmp/jvim
"set directory=>/home/shimura/tmp/jvim
"�G���[�x��
"no errorbells
"�J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler
"�V�����E�B���h�E�����ɊJ��
set splitbelow

"�n�C���C�g�L��
syntax on

" ���͂���Ă���e�L�X�g�̍ő啝�𖳌��ɂ���
set textwidth=0
" �܂�Ԃ��Ȃ�
set nowrapscan

" �R�}���h���C�����[�h�ő啶���������𖳎�
set wildignorecase
" �R�}���h���C�����[�h��zsh����
set wildmode=full,list

" /{pattern}�̓��͒��́u/�v���^�C�v����Ǝ����Łu\/�v���A
" ?{pattern}�̓��͒��́u?�v���^�C�v����Ǝ����Łu\?�v�� ���͂����悤�ɂȂ�
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
      set clipboard& clipboard+=unnamedplus
else
      set clipboard& clipboard+=unnamed,autoselect
endif

"+----------------------------------------------------------------------------------------+
"  �L�[�}�b�v�ݒ�
"+----------------------------------------------------------------------------------------+
"�����ꂪ��ʂ̐^�񒆂ɗ���悤�ɂ���
nmap n nzz
nmap N Nzz
"*�ŕ�����v����������
nmap * g*zz
nmap # g#zz
"�s���܂ňړ������Ƃ��\���s���^�񒆂ɂ���悤�ɂ���
nmap G Gzz
"<Space>�ŉ�ʒ����J�[�\���̂܂܃X�N���[��
nnoremap <Space> jzz
nnoremap <S-Space> kzz
"�C���T�[�g���[�h�ڍs���J�[�\���s����ʒ�����
nnoremap i zzi
nnoremap I zzI
nnoremap a zza
nnoremap A zzA
nnoremap o zzo
nnoremap O zzO
"�u���b�N�ړ����J�[�\���s����ʒ�����
nnoremap } }zz
nnoremap { {zz
"<C-o>�W�����v���J�[�\���s����ʒ�����
nnoremap <C-o> <C-o>zz

"�m�[�}�����[�h��Enter�ŉ��s����
nnoremap <CR> o<ESC>

"�\���s�P�ʂōs�ړ�
noremap j gj
noremap k gk

"<Leader><Leader>�ŕύX������Εۑ�
nnoremap <Leader><Leader> :up<CR>

"v$�����vv�ōs���܂őI��
vnoremap $ $h
vnoremap v $h

"+----------------------------------------------------------------------------------------+
"  �����R�[�h
"+----------------------------------------------------------------------------------------+
"set encoding=sjis
"set encoding=euc-jp
"set fileencodings=sjis,iso-2022-jp,utf-8

" ------------------------------------------------
" encoding
" > http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" ------------------------------------------------
"
" �����R�[�h�̎����F��
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
  endif
  
  if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings���\�z
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " �萔������
  unlet s:enc_euc
  unlet s:enc_jis
  endif
  
  " ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
  if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
  endif
  " ���s�R�[�h�̎����F��
  set fileformats=unix,dos,mac
  " ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
  if exists('&ambiwidth')
  set ambiwidth=double
  endif
  
  function! GetStatusEx()
  let str = ''
    if &ft != ''
      let str = str . '[' . &ft . ']'
    endif
    if has('multi_byte')
      if &fenc != ''
        let str = str . '[' . &fenc . ']'
      elseif &enc != ''
        let str = str . '[' . &enc . ']'
      endif
    endif
    if &ff != ''
      let str = str . '[' . &ff . ']'
  endif
  return str
  endfunction
  set statusline=%<%f\ %m%r%h%w%=%{GetStatusEx()}\ \ %l/%L,%c%V%8P
  set laststatus=2

"+----------------------------------------------------------------------------------------+
"  �V���^�b�N�X
"+----------------------------------------------------------------------------------------+
" neocomplcache���N�����ɗL��������
let g:neocomplcache_enable_at_startup = 1
" �啶������؂�Ƃ������C���h�J�[�h�̂悤�ɐU�镑���@�\
let g:neocomplcache_enable_camel_case_completion = 1
" _��؂�̕⊮��L����
let g:neocomplcache_enable_underbar_completion = 1
" �啶�������͂����܂ő啶���������̋�ʂ𖳎�����
let g:neocomplcache_smart_case = 1
" �V���^�b�N�X���L���b�V������Ƃ��̍ŏ���������3��
let g:neocomplcache_min_syntax_length = 3
"�蓮�⊮���ɕ⊮���s�����͐��𐧌�
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

" Perl�p�ݒ�
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = { 'default' : '', 'perl' : $HOME . '/.vim/dict/perl.dict' }

