alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias ec="emacsclient -n --alternate-editor=\"\" -c "
alias tunnel="ssh  -nNt -g -R :11592:0.0.0.0:3000 tunnlr2103@ssh1.tunnlr.com"
alias tunnelm="ssh  -nNt -g -R :11546:192.168.2.2:3001 tunnlr1700@ssh1.tunnlr.com"
alias ec2="50.17.217.109"
alias sshec2="ssh -i /Users/raghu/ssh/ec2/yoyo.pem root@50.17.217.109"
alias tunnelfr="ssh  -nNt -g -R :11591:0.0.0.0:3000 tunnlr2102@ssh1.tunnlr.com"
alias r2="rvm 1.9.2"
alias rvmrails="rvm use 1.9.2@rails3"
alias rvmrails31="rvm use 1.9.2@rails31"
alias redis="nohup redis-server > /dev/null &"
alias mcd="mkdir -p $1; cd $1"
alias E="nohup /Applications/Emacs.app/Contents/MacOS/Emacs > /dev/null 2>&1 &"
alias E2="cp ~/.rsense-1.9.2 ~/.rsense && rvm 1.9.2 && E"
alias teh="rvm use 1.8.7@tehelka"
alias tehelka="cp ~/.rsense-tehelka ~/.rsense && rvm use 1.8.7@tehelka && E"
alias tehm="ssh root@110.234.176.82"
alias tehn="ssh root@110.234.176.83"
alias teha="ssh root@110.234.176.84"
alias tehi="ssh root@110.234.176.86"
alias tehw="ssh root@110.234.176.85"
alias tehdb="ssh root@110.234.176.81"
alias bch="rvmrails31 && cd ~/code/ib/brewcharts"
alias sshib="ssh root@204.152.223.179"
alias sshmlt="ssh -i ssh/mylib/mylibec2.pem ubuntu@ec2-107-22-145-19.compute-1.amazonaws.com"
alias sshmlp="ssh -i ssh/mylib/mylibec2.pem ubuntu@ec2-107-22-31-89.compute-1.amazonaws.com"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export EC2_HOME=/Users/raghu/ssh/ec2/ec2-api-tools-1.3-42584
export EC2_CERT=/Users/raghu/ssh/ec2/cert-IHM26WD27GXKIKSBCLBE7QYET23FGGYB.pem
export EC2_PRIVATE_KEY=/Users/raghu/ssh/ec2/pk-IHM26WD27GXKIKSBCLBE7QYET23FGGYB.pem
# export PATH=/opt/local/lib/mysql5/bin:~/bin:$EC2_HOME/bin:~/scripts/:/Users/raghu/code/redis/redis-2.2.2/src:$PATH
# export PATH=/opt/local/lib/mysql5/bin:~/bin:$EC2_HOME/bin:~/scripts/:/Users/raghu/code/redis/redis-2.4.0-rc6/src:$PATH
export PATH=/opt/local/lib/mysql5/bin:$EC2_HOME/bin:~/scripts/:/Users/raghu/code/redis/redis-2.4.0-rc6/src:$PATH
# export USER_GEMS=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/lib/ruby/user-gems/1.8/gems/
export CATALINA_HOME=/Users/raghu/Downloads/apache-tomcat-6.0.29
export EDITOR=~/emacs/edit
export RSENSE_HOME=/Users/raghu/code/rsense-0.3
export GNUTERM=X11

export SENCHA_HOME=/Applications/Sencha
export PATH=$PATH:$SENCHA_HOME/appbuilder:$SENCHA_HOME/command:$SENCHA_HOME/jsbuilder:$SENCHA_HOME

export HADOOP_INSTALL=/Users/raghu/code/ib/hadoop/hadoop-0.20.205.0
export PATH=$HADOOP_INSTALL/bin:$PATH
export HADOOP_CLASSPATH=/Users/raghu/code/ib/cloudstore/bin:.

export RAILS_ENV=development

# MacPorts Installer addition on 2010-07-19_at_17:03:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
## End of copies from bashrc

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="robbyrussell"
#export ZSH_THEME="random"
export ZSH_THEME="sunaku"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby)
# export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
