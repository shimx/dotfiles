###############################################
# 参照                                        #
###############################################
# https://github.com/yuroyoro/dotfiles/blob/master/.zshrc.custom
# http://www1.matsue-torisen.co.jp/~naruse/Estab/Tips/zsh.html

###############################################
# 文字コード設定                              #
###############################################
# LANG
# http://curiousabt.blog27.fc2.com/blog-entry-65.html
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LESSCHARSET=utf-8

# oh-my-zsh export LESS=R
unset LESS

###############################################
# キーバインド                                #
###############################################
# viライクキーバインド
bindkey -v
# Emacsライクキーバインド
#bindkey -e

bindkey "^?" backward-delete-char   # BSキー
bindkey "^H" backward-delete-char   # BSキー
bindkey "^[[3~" delete-char         # Deleteキー
bindkey "^[[1~" beginning-of-line   # Homeキー
bindkey "^[[4~" end-of-line         # Endキー
bindkey "^A" beginning-of-line      # Ctrl-a
bindkey "^E" end-of-line            # Ctrl-e

###############################################
# 補完関係                                    #
###############################################
# 標準の補完設定
#autoload -U compinit
#compinit
# 他の設定を読み込んでから最後にcompinitを行う
# 本ファイル最後尾に記述

setopt auto_cd             # ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt autopushd           # 勝手にpushd cd -でTabを押すとdir listを表示
setopt pushd_ignore_dups   # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt auto_menu           # タブキー連打で補完候補を順に表示
setopt list_packed         # 補完候補を詰めて表示
setopt list_types          # 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt auto_list           # 補完候補が複数ある時に、一覧表示する
#setopt correct             # 自動修正機能(候補を表示) 
#setopt correct_all         # コマンドライン全てのスペルチェックをする
setopt hist_expand         # 補完時にヒストリを自動的に展開する。
#setopt auto_remove_slash   # 補完で末尾に補われた / を自動的に削除
unsetopt auto_remove_slash
setopt auto_param_slash    # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt noautoremoveslash   # 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt auto_param_keys     # カッコの対応などを自動的に補完する
setopt mark_dirs           # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt brace_ccl           # {a-c} を a b c に展開する機能を使えるようにする

setopt always_last_prompt  # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt magic_equal_subst   # = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt print_eight_bit     # 補完候補リストの日本語を正しく表示

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin # sudoも補完の対象

zstyle ':completion:*' list-colors di=34 fi=0         # 色付きで補完する
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # 色付きで補完する

# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# back-wordでの単語境界の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# コマンド補完ファイルを置いておくディレクトリを指定
fpath=($HOME/.zsh/functions/Completion ${fpath})

# zshのエディタ機能zedの有効化
# zsh editor
autoload zed

# Prediction configuration
autoload predict-on
#predict-off

###############################################
# 履歴関係                                    #
###############################################
# ヒストリー機能
HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_ignore_space     # 先頭がスペースの場合、ヒストリに追加しない
setopt extended_history      # 履歴ファイルに時刻を記録
setopt auto_pushd            # cd - と入力してTabキーで今までに移動したディレクトリを一覧表示
setopt pushd_ignore_dups     # ディレクトリスタックに重複する物は古い方を削除

setopt extended_history      # 履歴ファイルに時刻を記録
setopt pushd_ignore_dups     # ディレクトリスタックに重複する物は古い方を削除

# コマンド履歴の検索機能の設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
#bindkey "^[OA" history-beginning-search-backward-end
#bindkey "^[OB" history-beginning-search-forward-end
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end
# 複数行コマンドの場合、上記の設定だと少々不都合
# tcshの様にする場合は以下のようにする
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# インクリメンタルサーチの設定
# glob(*)によるインクリメンタルサーチ
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# ^でcd ..する
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
# bindkey '\^' cdup

###############################################
# プロンプト関係                              #
###############################################
# プロンプトに escape sequence (環境変数) を通す
setopt prompt_subst

# ^[  は「エスケープ」
#PROMPT="" # 通常のプロンプト
#PROMPT2="" # forやwhile/複数行入力時などに表示されるプロンプト
#SPROMPT="" # 入力ミスを確認する場合に表示されるプロンプト
#RPROMPT="" # 右に表示したいプロンプト(24時間制での現在時刻)

if [ $USER = "root" ]
then
    PROMPT="%{[31m%}%B%m%b%{[m%} $ % "
    RPROMPT="[%{[31m%}%~ %T%{[m%}]"
    HOME=/root
    path=(${path} ${sudo_path})
else
    PROMPT="%{[39m%}[%B%n@%m%b]%{[m%} $ % "
    RPROMPT="[%{[39m%}%~ %T%{[m%}]"
fi

setopt transient_rprompt                    # 右プロンプトに入力がきたら消す

# ターミナルのタイトル
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

###############################################
# その他                                      #
###############################################
#umask 022                  # ファイル作成時のパーミッション

#setopt no_beep               # ビープ音を消す
setopt nolistbeep           # 補完候補表示時などにビープ音を鳴らさない

#setopt interactive_comments # コマンドラインで # 以降をコメントとする

setopt numeric_glob_sort     # 辞書順ではなく数値順でソート

setopt no_multios            # zshのリダイレクト機能を制限する

unsetopt promptcr            # 改行コードで終らない出力もちゃんと出力する
#setopt ignore_eof           # Ctrl-dでログアウトしない

setopt no_hup                # ログアウト時にバックグラウンドジョブをkillしない
setopt no_checkjobs          # ログアウト時にバックグラウンドジョブを確認しない
setopt notify                # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる

setopt rm_star_wait         # rm * を実行する前に確認
#setopt rm_star_silent        # rm * を実行する前に確認しない
#setopt no_clobber           # リダイレクトで上書きを禁止
unsetopt no_clobber          # リダイレクトで上書きを許可

#setopt chase_links          # シンボリックリンクはリンク先のパスに変換してから実行
#setopt print_exit_value     # 戻り値が 0 以外の場合終了コードを表示
#setopt single_line_zle      # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる

setopt extended_glob         # 拡張グロブを有効にする
unsetopt flow_control        # (shell editor 内で) C-s, C-q を無効にする
setopt no_flow_control       # C-s, C-qを無効にする。

# カーソル位置から前方削除(Ctrl-u)
bindkey '^U' backward-kill-line

# Ctrl-h で単語ごとに削除
bindkey "^h" backward-kill-word
# / を単語の一部とみなさない記号の環境変数から削除
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#function chpwd() { ls }     # cd の後 ls も実行

# zsh の exntended_glob と HEAD^^^ を共存させる。
# http://subtech.g.hatena.ne.jp/cho45/20080617/1213629154
typeset -A abbreviations
abbreviations=(
  "L" "| $PAGER"
  "G" "| grep"

  "HEAD^" "HEAD\\^"
  "HEAD^^" "HEAD\\^\\^"
  "HEAD^^^" "HEAD\\^\\^\\^"
  "HEAD^^^^" "HEAD\\^\\^\\^\\^\\^"
  "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

# 略語展開設定
magic-abbrev-expand () {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}

magic-abbrev-expand-and-insert () {
    magic-abbrev-expand
    zle self-insert
}

magic-abbrev-expand-and-accept () {
    magic-abbrev-expand
    zle accept-line
}

no-magic-abbrev-expand () {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-insert
zle -N magic-abbrev-expand-and-accept
zle -N no-magic-abbrev-expand
bindkey "\r" magic-abbrev-expand-and-accept # M-x RET はできなくなる
bindkey "^J" accept-line # no magic
bindkey " " magic-abbrev-expand-and-insert
bindkey "." magic-abbrev-expand-and-insert
bindkey "^x " no-magic-abbrev-expand

###############################################
# ターミナル                                  #
###############################################
## terminal configuration
# http://journal.mycom.co.jp/column/zsh/009/index.html
unset LSCOLORS

case "${TERM}" in
xterm)
    export TERM=xterm-color

    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character

    stty erase
    ;;

cons25)
    unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad

    export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30'
    zstyle ':completion:*' list-colors \
        'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;

kterm*|xterm*)
   # Terminal.app
# precmd() {
# echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
# }
    # export LSCOLORS=exfxcxdxbxegedabagacad
    # export LSCOLORS=gxfxcxdxbxegedabagacad
    # export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30'

    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad

    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;

dumb)
    echo "Welcome Emacs Shell"
    ;;
esac

###############################################
# エイリアス                                  #
###############################################
# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

###############################################
# 他の設定ファイルを読み込む                  #
###############################################
#[ -f $HOME/.zsh/zshrc.mine ] && source $HOME/.zsh/zshrc.mine

[ -f $HOME/dotfiles/config/zsh/rc/alias.zsh ] && source $HOME/dotfiles/config/zsh/rc/alias.zsh

case "${OSTYPE}" in
  # MacOSX
darwin*)
  # ここに設定
  [ -f $HOME/dotfiles/config/zsh/rc/osx.zsh ] && source $HOME/dotfiles/config/zsh/rc/osx.zsh
  ;;
  # Linux
linux*)
  # ここに設定
  [ -f $HOME/dotfiles/config/zsh/rc/linux.zsh ] && source $HOME/dotfiles/config/zsh/rc/linux.zsh
  ;;
esac

## local固有設定
[ -f $HOME/.zsh/zshrc.local ] && source $HOME/.zsh/zshrc.local

