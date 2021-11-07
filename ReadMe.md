# 1.VIM INITIAL ENVIRONMENT

## vimrc
1. put .vimrc files to home dir, ``~``
2. put to colors(jellybeans.vim) to ``~/.vim/``

## zshrc

### install zsh 

```bash
$ apk add zsh 
# for chsh
$ apk add shadow
$ chsh -s $(which zsh)
$ apk add zsh-vcs
```

if you have have password trouble in chsh, modify 

``etc/pam.d/chsh``

```bash
$ auth sufficient pam_shells.so
```



### install oh-my-zsh

```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
``` 

apply agnoster

```bash
$ ZSH_THEME="agnoster"
```

### install powerline font 

```bash
# clone
$ git clone https://github.com/powerline/fonts.git --depth=1
# install
$ cd fonts
$ ./install.sh
# clean-up a bit
$ cd ..
$ rm -rf fonts
```

or 

```bash
$ ./font.sh
```

set font as 'Incololata for Powerline'

### syntax highlighting in command line

```bash
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
$ echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

# 2.APPENDIX

## 2-1. ShortCut

easy to forget shortcut's list.

### Split

#### basic

```bash
:vsp {file-name}
```

includes specifying file name, 
```bash
:10sp ~/.zshrc
```

```bash
:sp
```

#### focusing  

Ctrl + w + {direction}

the {direction} is, one of `h,j,k,l`

#### Resizing

- vertical split size
Ctrl + w + > (bigger)
Ctrl + w + < (smaller)

```bash
:vertical resize {N}
```

- horizontal split size

'Ctrl' + 'w' + '+' (bigger)
'Ctrl' + 'w' + '-' (smaller)

```bash
:resize {N}
```

### Mode

- getting in to explorer mode
```bash 
:Sexplore
```
```bash
:Vexplore
```

### File Manage

- create directory
in file explore mode, 'd' for directory, '%' for file.

- 

### Viewer

- font size
'cmd' + '+' or 'cmd' + 'shift' + '+'

- move cursor 
n + {direction}

the {direction} is, one of `h,j,k,l`

- move cursor to line's edge
end of line, g + _
start of line, g + ^


### Edit

- enter insert mode to after last charactor.
``a``


## 2-2. Markdown Preview
