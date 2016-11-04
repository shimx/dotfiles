" dein.vimと使った典型的な初期化処理 {{{
" 古臭いvi互換機能を無効化する
if ! &compatible | set nocompatible | endif
" nvim スペシャル設定
if has('nvim') | let $NVIM_TUI_ENABLE_TRUE_COLOR=1 | endif
 " Reset autocmd
augroup MyAutoCmd
  autocmd!
augroup END
" dein.vim 自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone --depth 1 https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:lazy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, expand('<sfile>:p'), s:toml_file, s:lazy_toml_file])
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  let g:dein#types#git#clone_depth = 1
  call dein#install()
endif
" }}}

"+----------------------------------------------------------------------------------------+
"  基本設定
"+----------------------------------------------------------------------------------------+
"  システム設定系
" ------------------------------------------------
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 起動時のメッセージを消す
set shortmess+=I
" 外部のエディタで編集中のファイルが変更されたら自動的に読み直す
set autoread
" コマンドの履歴保存数を指定
set history=10000
" ビープ音を抑制
set vb t_vb=
" エラーベル
"no errorbells
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" バックアップ
set nobackup
"set backup
"set backupdir=>/home/shimura/tmp/jvim
"set directory=>/home/shimura/tmp/jvim
" 新しいウィンドウを下に開く
set splitbelow

" Diff設定 埋め立て行を表示、常に垂直分割
set diffopt=filler,vertical

" コマンドラインモードをzsh風に
set wildmode=full,list
" コマンドラインモードで大文字小文字を無視
set wildignorecase

" ------------------------------------------------
"  ステータスライン表示
" ------------------------------------------------
" プラグインに変更
"function! GetStatusEx()
"  let str = ''
"  if &ft != ''
"    let str = str . '[' . &ft . ']'
"  endif
"  if has('multi_byte')
"    if &fenc != ''
"      let str = str . '[' . &fenc . ']'
"    elseif &enc != ''
"      let str = str . '[' . &enc . ']'
"    endif
"  endif
"  if &ff != ''
"    let str = str . '[' . &ff . ']'
"  endif
"  return str
"endfunction
"set statusline=%<%f\ %m%r%h%w%=%{GetStatusEx()}\ \ %l/%L,%c%V%8P
set laststatus=2

" ------------------------------------------------
"  表示系
" ------------------------------------------------
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 折り返さない
set nowrapscan
" 行番号を表示する
set number
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=tab:>\ ,extends:<
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
match ZenkakuSpace /　/ " 全角文字
" 閉じ括弧が入力されたとき、対応する括弧を点滅表示しない
set noshowmatch
" ハイライト有効
syntax on

" ------------------------------------------------
"  検索系
" ------------------------------------------------
" インクリメンタルサーチを行う
set incsearch
" 検索パターンにおいて大文字と小文字を区別しない
"set ignorecase
" 検索時に大文字を含んでいたら大/小を区別
"set smartcase
" 検索結果をハイライトしない
set nohlsearch
" 検索をファイルの先頭へループしない
set nowrapscan

" ------------------------------------------------
"  インデント・タブ
" ------------------------------------------------
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
"if .. endifなどインデント幅が合わないのでコメンアウト
"set smartindent
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
" タブの代わりに空白文字を挿入する
set expandtab
" タブ幅を設定
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ------------------------------------------------
"  入力補助
" ------------------------------------------------
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" クリップボードをOSと連携
" Mac上だとペーストの際改行されてしまうのでコメントアウト
"if has('unnamedplus')
"  set clipboard& clipboard+=unnamedplus,unnamed
"else
"  set clipboard& clipboard+=unnamed
"endif

"+----------------------------------------------------------------------------------------+
"  文字コード
"+----------------------------------------------------------------------------------------+
"set encoding=sjis
"set encoding=euc-jp
"set fileencodings=sjis,iso-2022-jp,utf-8

" ------------------------------------------------
" encoding
" > http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" ------------------------------------------------
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
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
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"+----------------------------------------------------------------------------------------+
"  キーマップ設定
"+----------------------------------------------------------------------------------------+
" 検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
" *で部分一致も検索する
nmap * g*zz
nmap # g#zz
" 行末まで移動したとき表示行が真ん中にくるようにする
nmap G Gzz
" <Space>で画面中央カーソルのままスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz
" インサートモード移行時カーソル行を画面中央に
nnoremap i zzi
nnoremap I zzI
nnoremap a zza
nnoremap A zzA
nnoremap o zzo
nnoremap O zzO
" ブロック移動時カーソル行を画面中央に
nnoremap } }zz
nnoremap { {zz
" <C-o>ジャンプ時カーソル行を画面中央に
nnoremap <C-o> <C-o>zz

" ノーマルモード時Enterで改行する
nnoremap <CR> o<ESC>

" 表示行単位で行移動
noremap j gj
noremap k gk

" <Leader><Leader>で変更があれば保存
nnoremap <Leader><Leader> :up<CR>

" v$およびvvで行末まで選択
vnoremap $ $h
vnoremap v $h

"+----------------------------------------------------------------------------------------+
"  シンタックス
"+----------------------------------------------------------------------------------------+
" neocomplcacheを起動時に有効化する
let g:neocomplcache_enable_at_startup = 1
" 大文字を区切りとしたワイルドカードのように振る舞う機能
let g:neocomplcache_enable_camel_case_completion = 1
" _区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_smart_case = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" 手動補完時に補完を行う入力数を制御
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

" Perl用設定
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

" Ruby用設定
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = { 'default' : '', 'perl' : $HOME . '/.vim/dict/perl.dict' }

