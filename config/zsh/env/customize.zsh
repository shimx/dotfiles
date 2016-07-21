#----------------------------------------
# shell
#----------------------------------------
export SHELL=`which zsh`

#----------------------------------------
# language
#----------------------------------------
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

#----------------------------------------
# path settings
# cf.) http://yonchu.hatenablog.com/entry/20120415/1334506855
#----------------------------------------
# path, cdpath, fpath, manpathは
# zshが管理している環境変数で、
# 大文字のPATHとも紐付いてる
#   typeset
#    -U 重複パスを登録しない
#    -x exportも同時に行う
#    -T 環境変数へ紐付け
#
#   path=xxxx(N-/)
#     (N-/): 存在しないディレクトリは登録しない
#     パス(...): ...という条件にマッチするパスのみ残す
#        N: NULL_GLOBオプションを設定。
#           globがマッチしなかったり存在しないパスを無視する
#        -: シンボリックリンク先のパスを評価
#        /: ディレクトリのみ残す
#        .: 通常のファイルのみ残す

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

#----------------------------------------
# local bin path
#----------------------------------------
path=({${HOME},/usr/local,}/bin(N-/) ${path})

#----------------------------------------
# pager settings
#----------------------------------------
#
# ページャの設定
if type lv > /dev/null 2>&1; then
    # lvを優先する。
    export PAGER="lv"
else
    # lvがなかったらlessを使う。
    export PAGER="less"
fi

# lvの設定
export LV="-c -l"

if [ "$PAGER" != "lv" ]; then
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

# lessの設定
## -R: ANSIエスケープシーケンスのみ素通しする。
export LESS="-R"

#----------------------------------------
# grep settings
#----------------------------------------

# grepの設定
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
## grepのバージョンを検出。
grep_version="$(grep --version | head -n 1 | sed -e 's/^[^0-9.]*\([0-9.]*\)[^0-9.]*$/\1/')"

## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
case "$grep_version" in
    1.*|2.[0-4].*|2.5.[0-3])
    ;;
    *)
    ### grep 2.5.4以降のみの設定
        ### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
    GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
    ;;
esac
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する。
if grep --help 2>&1 | grep -q -- --exclude-dir; then
    GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi
### 可能なら色を付ける。
if grep --help 2>&1 | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi

#----------------------------------------
# dotfiles
#----------------------------------------
# リポジトリルートを使いまわし用に環境変をセット
DOTFILES_DIR=~/dotfiles
export DOTFILES_DIR

# リモート環境との連携用に XMODIFIERS をセット
if [[ $XMODIFIERS != *@dotfiles=* ]]; then
  export XMODIFIERS="${XMODIFIERS:+"$XMODIFIERS "}@dotfiles=on"
fi

# XDG Config Directory
if [[ -n $DOTFILES_DIR ]]; then
  export XDG_CONFIG_HOME=$DOTFILES_DIR/config
  export XDG_CACHE_HOME=~/.cache
  export XDG_DATA_HOME=~/.local/share
  #export XDG_CACHE_HOME=$DOTFILES_DIR/cache
  #export XDG_DATA_HOME=$DOTFILES_DIR/local/share
else
  export XDG_CONFIG_HOME=~/.config
  export XDG_CACHE_HOME=~/.cache
  export XDG_DATA_HOME=~/.local/share
fi

# Add path
if ! [[ -d $XDG_CACHE_HOME/dotfiles/bin ]]; then
  mkdir -p "$XDG_CACHE_HOME/dotfiles/bin"
fi
path=(${XDG_CACHE_HOME}/dotfiles/bin ${path})

#----------------------------------------
# editor
#----------------------------------------

if type nvim > /dev/null 2>&1; then
  export EDITOR=nvim
  alias vi=nvim
elif type vim > /dev/null 2>&1; then
  export EDITOR=vim
  alias vi=vim
else
  export EDITOR=vi
  ## vimがなくてもvimでviを起動する。
  alias vim=vi
fi

