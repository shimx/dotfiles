" このディレクトリは runtimepath に含まれてファイル名の制約とか面倒なので

" ./rc てディレクトリを掘って実体をそっちに移す
" cf.) https://github.com/kawaz/dotfiles
execute 'source' expand('<sfile>:p:h').'/rc/init.vim'
