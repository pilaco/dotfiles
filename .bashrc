#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias reload='. ~/.bashrc'

alias pacotes=" pacman -Qq | wc -l"
alias temperatura="curl http://wttr.in/~sao_paulo"
alias ls='ls --color=auto'
alias untarbz='tar -jxvf'
alias untargz='tar -zxvf'
alias untarxz='tar -Jxvf'
PS1='[\u@\h \W]\$ '

export LIBVA_DRIVER_NAME=vdpau # 
export VDPAU_DRIVER=r600       # test first w/o this variable
#Use in Arch 

# Editor padrão
export VISUAL="vim"

search ()
{
  find ./ -iname "*$1*"
}

# Converte vídeo para gif
gifenc ()
{
  palette="/tmp/palette.png"

  filters="fps=15,scale=320:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
}

